import 'package:equatable/equatable.dart';
import '../../core/failure.dart';
import '../../domain/entities/app_user.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final AppUser user;
  AuthAuthenticated(this.user);
  @override
  List<Object?> get props => [user];
}

class AuthUnauthenticated extends AuthState {}

class AuthFailure extends AuthState {
  final Failure failure;
  AuthFailure(this.failure);
  @override
  List<Object?> get props => [failure];
}

class AuthEmailVerificationSent extends AuthState {}

class AuthEmailVerified extends AuthState {}

class AuthEmailNotVerified extends AuthState {}

class AuthPasswordResetEmailSent extends AuthState {}

class AuthPasswordResetConfirmed extends AuthState {}

class AuthPasswordUpdated extends AuthState {}

class AuthAccountDeleted extends AuthState {}

class AuthMFAEnrolled extends AuthState {}

class AuthMFAVerified extends AuthState {}
