import 'package:equatable/equatable.dart';
import 'package:authentication/src/domain/params/login_params.dart';
import 'package:authentication/src/domain/params/register_params.dart';

import '../../domain/params/reset_password_params.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthLoginRequested extends AuthEvent {
  final LoginParams params;
  AuthLoginRequested(this.params);
  @override
  List<Object?> get props => [params];
}

class AuthRegisterRequested extends AuthEvent {
  final RegisterParams params;
  AuthRegisterRequested(this.params);
  @override
  List<Object?> get props => [params];
}

class AuthLogoutRequested extends AuthEvent {}

class AuthCheckCurrentUser extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class AuthSendEmailVerification extends AuthEvent {}

class AuthCheckEmailVerified extends AuthEvent {}

class AuthSendPasswordResetEmail extends AuthEvent {
  final String email;
  AuthSendPasswordResetEmail(this.email);
  @override
  List<Object?> get props => [email];
}

class AuthConfirmPasswordReset extends AuthEvent {
  final ResetPasswordParams params;
  AuthConfirmPasswordReset(this.params);
  @override
  List<Object?> get props => [params];
}

class AuthUpdatePassword extends AuthEvent {
  final String newPassword;
  AuthUpdatePassword(this.newPassword);
  @override
  List<Object?> get props => [newPassword];
}

class AuthLoginWithGoogle extends AuthEvent {}

class AuthLoginWithFacebook extends AuthEvent {}

class AuthLoginWithApple extends AuthEvent {}

class AuthLoginWithTwitter extends AuthEvent {}

class AuthLoginWithGithub extends AuthEvent {}

class AuthDeleteAccount extends AuthEvent {}

class AuthEnrollMFA extends AuthEvent {
  final String phoneNumber;
  AuthEnrollMFA(this.phoneNumber);
  @override
  List<Object?> get props => [phoneNumber];
}

class AuthVerifyMFA extends AuthEvent {
  final String code;
  AuthVerifyMFA(this.code);
  @override
  List<Object?> get props => [code];
}
