class RoomChat {

  factory RoomChat.fromJson(Map<String, dynamic> json) {
    return RoomChat(
      idUser: json['idUser'],
      msgType: json['msgType'],
      notify: json['notify'],
      shortContent: json['shortContent'],
      time: json['time'],
      idRoomChat: json['idRoomChat']
    );
  }

  Map<String, dynamic> toJson() => {
    'idUser': idUser,
    'time': time,
    'msgType': msgType,
    'notify': notify,
    'shortContent': shortContent,
    'idRoomChat': idRoomChat
  };

  RoomChat({
    this.idUser,
    this.time,
    this.notify,
    this.msgType,
    this.shortContent,
    this.idRoomChat
  });

  late String? idUser;
  late int? time;
  late int? notify;
  late int? msgType;
  late String? shortContent;
  late String? idRoomChat;
}