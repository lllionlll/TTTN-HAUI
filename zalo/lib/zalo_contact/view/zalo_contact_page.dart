import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common/navigate.dart';
import '../../models/user.dart';
import '../../repository/repository.dart';
import '../../zalo_chat_detail/view/zalo_chat_detail_page.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final myID = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      body: FutureBuilder(
          future: Repository.getListUser(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final listUser = snapshot.data as List<UserModel>;
            return ListView.builder(
              itemCount: listUser.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    navigateNotPop(
                      context,
                      ChatDetailPage(
                        idUser: listUser[index].uid!,
                        idRoomChat: myID + '_' + listUser[index].uid!,
                      )
                    );
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.grey.withOpacity(0.4),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: size.width,
                    height: 70,
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              listUser[index].avt!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 16,),
                        Text(
                          listUser[index].name ?? '',
                          style: TextStyle(
                              fontSize: 15
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
      ),
    );
  }
}

