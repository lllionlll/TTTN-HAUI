import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zalo/models/message.dart';
import 'package:zalo/repository/repository.dart';

class ChatDetailPage extends StatefulWidget {
  final String? idRoomChat;
  final String? idUser;
  ChatDetailPage({required this.idRoomChat, required this.idUser});
  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  TextEditingController input = TextEditingController();

  final ScrollController scrollController = ScrollController();
  final myID= FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: Repository.getRoomChat(widget.idRoomChat),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Scaffold(
          body: Center(
            child: CircularProgressIndicator(strokeWidth: 1,)
          )
        );
        List<Message> listMessage = [];
        snapshot.data!.docs.forEach((element) {
          listMessage.add(Message.fromJson(element.data() as Map<String, dynamic>));
        });
        return GestureDetector(
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios),
              ),
              elevation: 0.5,
              titleSpacing: 0,
              title: Container(
                height: AppBar().preferredSize.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nguyễn Hoàng Lâm',
                      style: TextStyle(
                          fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      'Truy cập 22 phút trước',
                      style: TextStyle(
                          fontSize: 12,
                        fontWeight: FontWeight.normal
                      ),
                    )
                  ],
                ),
              ),
              actions: [
                SizedBox(width: 8,),
                Icon(CupertinoIcons.phone),
                SizedBox(width: 16,),
                Icon(CupertinoIcons.videocam_fill),
                SizedBox(width: 16,),
                Icon(Icons.menu),
                SizedBox(width: 16,)
              ],
            ),
            body: itemMessage(size, listMessage),
          ),
        );
      }
    );
  }

  Column itemMessage(Size size, List<Message> listMessage) {
    return Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.lightBlue.withOpacity(0.05),
              child: CupertinoScrollbar(
                child: ListView.builder(
                  reverse: true,
                  controller: scrollController,
                  physics: BouncingScrollPhysics(),
                  itemCount: listMessage.length,
                  itemBuilder: (context, index) {
                    return index % 3 == 1
                    ? Container(
                      margin: EdgeInsets.only(
                        right: size.width * 0.15,
                        top: 16,
                        left: 8,
                        bottom: index == 0? 16 : 0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                'https://www.invert.vn/media/uploads/uploads/2022/12/06172901-11.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          Flexible(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.pink,
                                          blurRadius: 8,
                                        )
                                      ]
                                  ),
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listMessage[index].content!
                                      ),
                                      SizedBox(height: 8,),
                                      Text(
                                        '15:10',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 11
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                index % 2 == 0
                                ? Positioned(
                                  right: 4,
                                  bottom: 0,
                                  child: Container(
                                    child: Icon(
                                      CupertinoIcons.heart_solid,
                                      size: 13,
                                      color: Colors.red,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(100),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 10
                                          )
                                        ]
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2,
                                        vertical: 2
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                )
                                : Container()
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    : Container(
                      margin: EdgeInsets.only(
                        left: size.width * 0.15,
                        top: 16,
                        right: 16,
                        bottom: index == 0 ? 16 : 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      color: Color(0xffe5efff),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 10,
                                            color: Colors.purple
                                        )
                                      ]
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          listMessage[index].content!
                                      ),
                                      SizedBox(height: 8,),
                                      Text(
                                        '15:11',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 11
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                index % 2 == 0
                                ? Positioned(
                                  bottom: 0,
                                  left: 4,
                                  child: Container(
                                    child: Icon(
                                      CupertinoIcons.heart_solid,
                                      size: 13,
                                      color: Colors.red,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(100),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 10
                                          )
                                        ]
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2,
                                        vertical: 2
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                )
                                : Text('')
                              ],
                            )
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            width: size.width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.emoji_emotions_outlined),
                    SizedBox(width: 8,),
                  ],
                ),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {

                      });
                    },
                    controller: input,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Tin nhắn',
                      border: InputBorder.none,
                    ),
                  )
                ),
                input.text.isNotEmpty
                ? Row(
                  children: [
                    SizedBox(width: 8,),
                    GestureDetector(
                      onDoubleTap: () {},
                      onTap: () async {
                        final myID = FirebaseAuth.instance.currentUser!.uid;
                        final message = Message(
                          chatType: 0,
                          time: DateTime.now().microsecondsSinceEpoch,
                          msgType: 0,
                          idUser: myID,
                          content: input.text.trim(),
                          reaction: 0,
                        );
                        await Repository.sendMessage(
                          from: myID,
                          to: widget.idUser,
                          message: message,
                        );
                        input.clear();
                        setState(() {});
                      },
                      child: Icon(Icons.send_sharp)
                    )
                  ],
                )
                : Row(
                  children: [
                    SizedBox(width: 8,),
                    Icon(Icons.more_horiz),
                    SizedBox(width: 16,),
                    Icon(Icons.mic),
                    SizedBox(width: 16,),
                    Icon(Icons.image)
                  ],
                )
              ],
            ),
          )
        ],
      );
  }
}
