class User {
  final String id;
  final String password;
  final int age;

  User({required this.id, required this.password, required this.age});

  get getId => id;
  get getPassword => password;
  get getAge => age;
}
