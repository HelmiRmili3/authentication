class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });

  @override
  String toString() {
    return 'LoginParams(email: $email, password: $password)';
  }
}
