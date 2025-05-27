class RegisterParams {
  final String email;
  final String password;
  // final String firstName;
  // final String lastName;
  // final String displyName;
  // final String photoUrl;
  // final String phoneNumber;
  RegisterParams({
    required this.email,
    required this.password,
  });

  @override
  String toString() {
    return 'RegisterParams(email: $email, password: $password)';
  }
}
