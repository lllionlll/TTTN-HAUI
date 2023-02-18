class UserModel {

  UserModel({
    required this.email,
    required this.avt,
    required this.cover,
    required this.uid,
    required this.homeTown,
    required this.isActive,
    required this.lastActive,
    required this.old,
    required this.sex
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
      avt: (json['avt'] ?? '') as String,
      cover: (json['cover'] ?? '') as String,
      email: (json['email'] ?? '') as String,
      homeTown: (json['homeTown'] ?? '') as String,
      uid: (json['uid'] ?? '') as String,
      lastActive: (json['lastActive'] ?? 0) as int,
      old: (json['old'] ?? 0) as int,
      sex: (json['sex'] ?? 0) as int,
      isActive: (json['isActive'] ?? false) as bool
    );
  }

  late String? email;
  late String? uid;
  late String? avt;
  late String? cover;
  late String? homeTown;
  late int? old;
  late int? sex;
  late int? lastActive;
  late bool? isActive;


}