import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zalo/common/navigate.dart';
import 'package:zalo/models/room_chat.dart';
import 'package:zalo/models/user.dart';
import 'package:zalo/repository/repository.dart';
import 'package:zalo/zalo_chat_detail/view/zalo_chat_detail_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final myID = FirebaseAuth.instance.currentUser!.uid;

    return StreamBuilder(
      stream: Repository.getListRoomChat(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator(strokeWidth: 1,));
        List<RoomChat> listRoomChat = [];
        snapshot.data!.docs.forEach((element) {
          listRoomChat.add(RoomChat.fromJson(element.data() as Map<String, dynamic>));
        });
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: listRoomChat.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    navigateNotPop(
                      context,
                      ChatDetailPage(
                        idUser: listRoomChat[index].idUser,
                        idRoomChat: listRoomChat[index].idRoomChat,
                      )
                    );
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.grey.withOpacity(0.4),
                  child: itemRoomChat(
                    size: size,
                    roomChat: listRoomChat[index]
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Container itemRoomChat({
    required Size size,
    required RoomChat roomChat
  }) {
    return Container(
      width: size.width,
      height: 70,
      padding: EdgeInsets.only(left: 16),
      child: FutureBuilder(
          future: Repository.getUser(roomChat.idUser!),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text('Lỗi');
            if (!snapshot.hasData) return Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            );
            UserModel user = snapshot.data!;
            return Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      user.avt!,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name!,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 8,),
                              Text(
                                roomChat.shortContent!,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '5 giờ',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey
                              ),
                            ),
                            SizedBox(height: 8,),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                              decoration: BoxDecoration(
                                  color: roomChat.notify == 0 ? null : Colors.redAccent,
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Text(
                                '${roomChat.notify == 0 ? '' : roomChat.notify}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 16,)
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 0.2,
                                color: Colors.grey
                            )
                        )
                    ),
                  ),
                )
              ],
            );
          }
      ),
    );
  }
}

