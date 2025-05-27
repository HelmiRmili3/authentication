class ResetPasswordParams {
  final String code;
  final String email;
  final String password;
  final String newPassword;

  ResetPasswordParams({
    required this.code,
    required this.email,
    required this.password,
    required this.newPassword,
  });
}
