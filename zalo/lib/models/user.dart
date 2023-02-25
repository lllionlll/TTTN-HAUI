class UserModel {

  UserModel({
    this.name,
    this.email,
    this.avt,
    this.cover,
    this.uid,
    this.homeTown,
    this.isActive,
    this.lastActive,
    this.old,
    this.sex
  });

  UserModel copyWith({
    String? email,
    String? avt,
    String? cover,
    String? uid,
    String? homeTown,
    bool? isActive,
    int? lastActive,
    int? old,
    int? sex
  }) =>
    UserModel(
      email: email ?? '123',
      avt: avt ?? this.avt,
      cover: cover ?? this.cover,
      uid: uid ?? this.uid,
      homeTown: homeTown ?? this.homeTown,
      isActive: isActive ?? this.isActive,
      lastActive: lastActive ?? this.lastActive,
      old: old ?? this.old,
      sex: sex ?? this.sex,
    );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email' : email,
    'uid' : uid,
    'avt' : avt,
    'cover' : cover,
    'homeTown' : homeTown,
    'old' : old,
    'sex' : sex,
    'lastActive' : lastActive,
    'isActive' : isActive,
  };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      avt: json['avt'],
      cover: json['cover'],
      email: json['email'],
      homeTown: json['homeTown'],
      uid: json['uid'],
      lastActive: json['lastActive'],
      old: json['old'],
      sex: json['sex'],
      isActive: json['isActive']
    );
  }

  late String? email;
  late String? name;
  late String? uid;
  late String? avt;
  late String? cover;
  late String? homeTown;
  late int? old;
  late int? sex;
  late int? lastActive;
  late bool? isActive;


}