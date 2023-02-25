import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zalo/constants/constants.dart';
import 'package:zalo/models/room_chat.dart';
import 'package:zalo/models/user.dart';

import '../models/message.dart';

class Repository {
  static Future<String> createUser({
    required String emailAddress,
    required String password
  }) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      UserModel user = UserModel(
        email: emailAddress,
        isActive: true,
        old: null,
        lastActive: null,
        uid: credential.user!.uid,
        homeTown: null,
        cover: null,
        avt: null,
        sex: 0
      );

      await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set(user.toJson());

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Constants.WEAK_PASSWORD;
      } else if (e.code == 'email-already-in-use') {
        return Constants.EMAIL_IS_READY;
      }
    } catch (e) {
      print('======================>${e.toString()}');
    }
    return Constants.CREAT_SUCCESS;
  }

  static Future<String> signIn({
    required String emailAddress,
    required String password
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      print('======================>${e.toString()}');
      return Constants.ACCOUNT_NOT_CORRECT;
    }
    return Constants.SIGN_IN_SUCCESS;
  }

  static Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print('======================>${e.toString()}');
    }
  }
  
  static Future<UserModel> getUser(String uid) async {
    try {
      final user = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();
      return UserModel.fromJson(user.data()!);
    } catch (e) {
      print('======================>${e.toString()}');
    }
    return UserModel();
  }

  static Future<List<UserModel>> getListUser() async {
    try {
      List<UserModel> listUser = [];
      await FirebaseFirestore.instance
          .collection('users')
          .get()
          .then((value) {
            value.docs.forEach((element) {
              listUser.add(UserModel.fromJson(element.data()));
            });
      });
      return listUser;
    } catch (e) {
      print('======================>${e.toString()}');
    }
    return [];
  }

  static Stream<QuerySnapshot> getListRoomChat() {
    return FirebaseFirestore.instance
        .collection('listRoomChat')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('idRoomChat')
        .orderBy('time', descending: true)
        .snapshots();
  }

  static Stream<QuerySnapshot> getRoomChat(String? uid) {
    return FirebaseFirestore.instance
        .collection('roomChat')
        .doc(uid)
        .collection('roomChat')
        .orderBy('time', descending: true)
        .snapshots();
  }

  static Future<void> sendMessage({
    required String? from,
    required String? to,
    required Message message
  }) async {
    try {
      RoomChat fromRoomChat = RoomChat(
        idUser: from,
        msgType: 0,
        time: DateTime.now().microsecondsSinceEpoch,
        shortContent: message.content,
        notify: 0,
        idRoomChat: from! + '_' + to!
      );

      RoomChat toRoomChat = RoomChat(
          idUser: from,
          msgType: 0,
          time: DateTime.now().microsecondsSinceEpoch,
          shortContent: message.content,
          notify: 0,
        idRoomChat: to + '_' + from
      );

      await FirebaseFirestore.instance
          .collection('listRoomChat')
          .doc(from)
          .collection('idRoomChat')
          .doc(from + '_' + to)
          .set(fromRoomChat.toJson());


      if (from != to) await FirebaseFirestore.instance
          .collection('listRoomChat')
          .doc(to)
          .collection('idRoomChat')
          .doc(to + '_' + from)
          .set(toRoomChat.toJson());

      await FirebaseFirestore.instance
          .collection('roomChat')
          .doc(from + '_' + to)
          .collection('roomChat')
          .add(message.toJson());

      if (from != to) await FirebaseFirestore.instance
          .collection('roomChat')
          .doc(to + '_' + from)
          .collection('roomChat')
          .add(message.toJson());
    } catch (e) {
      print('======================>${e.toString()}');
    }
  }
}