class User {
  final String name;
  final String email;
  final String password;
  final String photoUrl;
  final List<int> ownedEnvironments;
  final List<int> sharedEnvironments;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.photoUrl,
    required this.ownedEnvironments,
    required this.sharedEnvironments,
  });
}
