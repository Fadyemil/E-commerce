class UserEntity {
  final String name;
  final String email;
  final String uId;
  final String password;

  UserEntity({
    required this.name,
    required this.email,
    required this.uId,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'password': password,
    };
  }
}
