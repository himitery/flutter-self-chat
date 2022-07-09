class User {
  final String nickname;
  final String profileImage;

  User({required this.nickname, required this.profileImage});

  factory User.fromJson(Map<String, dynamic> json) => User(
        nickname: json['nickname'],
        profileImage: json['profileImage'],
      );

  Map<String, dynamic> toJson() => {
        'nickname': nickname,
        'profileImage': profileImage,
      };
}
