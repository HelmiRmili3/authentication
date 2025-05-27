import 'package:authentication/src/domain/usecases/confirme_password_rest.dart';
import 'package:authentication/src/domain/usecases/enroll_mfa.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/delete_account.dart';
import '../../domain/usecases/get_current_user.dart';
import '../../domain/usecases/is_email_verified.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/login_with_apple.dart';
import '../../domain/usecases/login_with_facebook.dart';
import '../../domain/usecases/login_with_github.dart';
import '../../domain/usecases/login_with_google.dart';
import '../../domain/usecases/login_with_twitter.dart';
import '../../domain/usecases/logout.dart';
import '../../domain/usecases/register.dart';
import '../../domain/usecases/send_email_verification.dart';
import '../../domain/usecases/update_password.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final Register register;
  final Logout logout;
  final GetCurrentUser getCurrentUser;
  final SendEmailVerification sendEmailVerification;
  final IsEmailVerified isEmailVerified;
  final SendEmailVerification sendPasswordResetEmail;
  final ConfirmePasswordRest confirmPasswordReset;
  final UpdatePassword updatePassword;
  final LoginWithGoogle loginWithGoogle;
  final LoginWithFacebook loginWithFacebook;
  final LoginWithApple loginWithApple;
  final LoginWithTwitter loginWithTwitter;
  final LoginWithGithub loginWithGithub;
  final DeleteAccount deleteAccount;
  final EnrollMfa enrollMFA;

  AuthBloc({
    required this.login,
    required this.register,
    required this.logout,
    required this.getCurrentUser,
    required this.sendEmailVerification,
    required this.isEmailVerified,
    required this.sendPasswordResetEmail,
    required this.confirmPasswordReset,
    required this.updatePassword,
    required this.loginWithGoogle,
    required this.loginWithFacebook,
    required this.loginWithApple,
    required this.loginWithTwitter,
    required this.loginWithGithub,
    required this.deleteAccount,
    required this.enrollMFA,
  }) : super(AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthRegisterRequested>(_onRegisterRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthCheckCurrentUser>(_onCheckCurrentUser);
    on<AuthSendEmailVerification>(_onSendEmailVerification);
    on<AuthCheckEmailVerified>(_onCheckEmailVerified);
    on<AuthSendPasswordResetEmail>(_onSendPasswordResetEmail);
    on<AuthConfirmPasswordReset>(_onConfirmPasswordReset);
    on<AuthUpdatePassword>(_onUpdatePassword);
    on<AuthLoginWithGoogle>(_onLoginWithGoogle);
    on<AuthLoginWithFacebook>(_onLoginWithFacebook);
    on<AuthLoginWithApple>(_onLoginWithApple);
    on<AuthLoginWithTwitter>(_onLoginWithTwitter);
    on<AuthLoginWithGithub>(_onLoginWithGithub);
    on<AuthDeleteAccount>(_onDeleteAccount);
    on<AuthEnrollMFA>(_onEnrollMFA);
    // on<AuthVerifyMFA>(_onVerifyMFA);
  }

  Future<void> _onLoginRequested(
      AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await login(event.params);
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> _onRegisterRequested(
      AuthRegisterRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await register(event.params);
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> _onLogoutRequested(
      AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await logout();
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (_) => emit(AuthUnauthenticated()),
    );
  }

  Future<void> _onCheckCurrentUser(
      AuthCheckCurrentUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await getCurrentUser();
    result.fold(
      (failure) => emit(AuthUnauthenticated()),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> _onSendEmailVerification(
      AuthSendEmailVerification event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await sendEmailVerification();
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (_) => emit(AuthEmailVerificationSent()),
    );
  }

  Future<void> _onCheckEmailVerified(
      AuthCheckEmailVerified event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await isEmailVerified();
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (isVerified) =>
          emit(isVerified ? AuthEmailVerified() : AuthEmailNotVerified()),
    );
  }

  Future<void> _onSendPasswordResetEmail(
      AuthSendPasswordResetEmail event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await sendPasswordResetEmail();
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (_) => emit(AuthPasswordResetEmailSent()),
    );
  }

  Future<void> _onConfirmPasswordReset(
      AuthConfirmPasswordReset event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await confirmPasswordReset(event.params);
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> _onUpdatePassword(
      AuthUpdatePassword event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await updatePassword(event.newPassword);
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (_) => emit(AuthPasswordUpdated()),
    );
  }

  Future<void> _onLoginWithGoogle(
      AuthLoginWithGoogle event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await loginWithGoogle();
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> _onLoginWithFacebook(
      AuthLoginWithFacebook event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await loginWithFacebook();
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> _onLoginWithApple(
      AuthLoginWithApple event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await loginWithApple();
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> _onLoginWithTwitter(
      AuthLoginWithTwitter event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await loginWithTwitter();
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> _onLoginWithGithub(
      AuthLoginWithGithub event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await loginWithGithub();
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> _onDeleteAccount(
      AuthDeleteAccount event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await deleteAccount();
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (_) => emit(AuthAccountDeleted()),
    );
  }

  Future<void> _onEnrollMFA(
      AuthEnrollMFA event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await enrollMFA(event.phoneNumber);
    result.fold(
      (failure) => emit(AuthFailure(failure)),
      (_) => emit(AuthMFAEnrolled()),
    );
  }

  // Future<void> _onVerifyMFA(
  //     AuthVerifyMFA event, Emitter<AuthState> emit) async {
  //   emit(AuthLoading());
  //   final result = await verifyMFA(event.code);
  //   result.fold(
  //     (failure) => emit(AuthFailure(failure)),
  //     (_) => emit(AuthMFAVerified()),
  //   );
  // }
}
