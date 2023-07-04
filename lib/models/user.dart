class User {
  int id;
  String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
    );
  }
}
