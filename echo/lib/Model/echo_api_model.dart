class Users {
  final String id;
  final String email;
  final String password;

  const Users({
    required this.id,
    required this.email,
    required this.password,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        id: json['id'], email: json['email'], password: json['password']);
  }
}
