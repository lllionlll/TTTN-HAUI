class Message {
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        idUser: json['idUser'],
        content: json['content'],
        msgType: json['msgType'],
        reaction: json['reaction'],
        chatType: json['chatType'],
        time: json['time']
    );
  }

  Map<String, dynamic> toJson() => {
    'idUser': idUser,
    'content': content,
    'time': time,
    'msgType': msgType,
    'reaction': reaction,
    'chatType': chatType
  };

  Message({
    this.idUser,
    this.content,
    this.time,
    this.reaction,
    this.msgType,
    this.chatType
  });

  late String? idUser;
  late String? content;
  late int? time;
  late int? chatType;
  late int? msgType;
  late int? reaction;
}