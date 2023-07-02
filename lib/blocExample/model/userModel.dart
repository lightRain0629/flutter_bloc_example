class UserModel {
  String username;
  String email;
  String password;
  String token;

  UserModel({
    required this.username,
    required this.email,
    required this.password,
    this.token = '',
  });
}
