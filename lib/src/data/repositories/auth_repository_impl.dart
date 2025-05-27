import '../../core/failure.dart';
import '../../core/types/either.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/params/login_params.dart';
import '../../domain/params/register_params.dart';
import '../../domain/params/reset_password_params.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Stream<Either<Failure, AppUser>> authStateChanges() {
    return _remoteDataSource.authStateChanges();
  }

  @override
  Future<Either<Failure, AppUser>> confirmPasswordReset(
      ResetPasswordParams params) {
    return _remoteDataSource.confirmPasswordReset(params);
  }

  @override
  Future<Either<Failure, void>> deleteAccount() {
    return _remoteDataSource.deleteAccount();
  }

  @override
  Future<Either<Failure, AppUser>> enrollMFA(String phoneNumber) {
    return _remoteDataSource.enrollMFA(phoneNumber);
  }

  @override
  Future<Either<Failure, AppUser>> getCurrentUser() {
    return _remoteDataSource.getCurrentUser();
  }

  @override
  Future<Either<Failure, String>> getIdToken() {
    return _remoteDataSource.getIdToken();
  }

  @override
  Future<Either<Failure, bool>> isEmailVerified() {
    return _remoteDataSource.isEmailVerified();
  }

  @override
  Future<Either<Failure, AppUser>> login(LoginParams params) {
    return _remoteDataSource.login(params);
  }

  @override
  Future<Either<Failure, void>> logout() {
    return _remoteDataSource.logout();
  }

  @override
  Future<Either<Failure, AppUser>> refreshToken() {
    return _remoteDataSource.refreshToken();
  }

  @override
  Future<Either<Failure, AppUser>> register(RegisterParams params) {
    return _remoteDataSource.register(params);
  }

  @override
  Future<Either<Failure, AppUser>> sendEmailVerification() {
    return _remoteDataSource.sendEmailVerification();
  }

  @override
  Future<Either<Failure, AppUser>> sendPasswordResetEmail(String email) {
    return _remoteDataSource.sendPasswordResetEmail(email);
  }

  @override
  Future<Either<Failure, AppUser>> signInWithApple() {
    return _remoteDataSource.signInWithApple();
  }

  @override
  Future<Either<Failure, AppUser>> signInWithFacebook() {
    return _remoteDataSource.signInWithFacebook();
  }

  @override
  Future<Either<Failure, AppUser>> signInWithGithub() {
    return _remoteDataSource.signInWithGithub();
  }

  @override
  Future<Either<Failure, AppUser>> signInWithGoogle() {
    return _remoteDataSource.signInWithGoogle();
  }

  @override
  Future<Either<Failure, AppUser>> signInWithTwitter() {
    return _remoteDataSource.signInWithTwitter();
  }

  @override
  Future<Either<Failure, AppUser>> updatePassword(String newPassword) {
    return _remoteDataSource.updatePassword(newPassword);
  }

  @override
  Future<Either<Failure, AppUser>> verifyMFA(String code) {
    return _remoteDataSource.verifyMFA(code);
  }
}
