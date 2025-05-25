import 'package:authentication/domain/entities/user.dart';

import '../core/failure.dart';
import '../core/types/either.dart';

abstract class AuthRemoteDataSource {
  // ✅ Basic Auth
  Future<Either<User, Failure>> login(String email, String password);
  Future<Either<User, Failure>> register(String email, String password);
  Future<Either<void, Failure>> logout();

  // 👤 User Info
  Future<Either<User, Failure>> getCurrentUser();
  Stream<Either<User, Failure>> authStateChanges();

  // ✅ Email Verification
  Future<Either<User, Failure>> sendEmailVerification();
  Future<Either<bool, Failure>> isEmailVerified();

  // 🔁 Password Management
  Future<Either<User, Failure>> sendPasswordResetEmail(String email);
  Future<Either<User, Failure>> confirmPasswordReset(
      String code, String newPassword);
  Future<Either<User, Failure>> updatePassword(String newPassword);

  // ✏️ Profile Management
  Future<Either<User, Failure>> updateDisplayName(String name);
  Future<Either<User, Failure>> updateEmail(String newEmail);
  Future<Either<User, Failure>> updateProfilePhoto(String photoUrl);

  // 🧪 Token Management (for server API calls)
  Future<Either<String, Failure>> getIdToken();
  Future<Either<User, Failure>> refreshToken();

  // 🔐 Multi-Provider Support (optional)
  Future<Either<User, Failure>> signInWithGoogle();
  Future<Either<User, Failure>> signInWithFacebook();
  Future<Either<User, Failure>> signInWithApple();
  Future<Either<User, Failure>> signInWithTwitter();
  Future<Either<User, Failure>> signInWithGithub();

  // 🧾 Account Deletion
  Future<Either<void, Failure>> deleteAccount();

  // 🛡️ MFA (Optional)
  Future<Either<User, Failure>> enrollMFA(String phoneNumber);
  Future<Either<User, Failure>> verifyMFA(String code);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // final AuthService authService;
  // final FirebaseAuth firebaseAuth;

  // AuthRemoteDataSourceImpl({
  //   required this.authService,
  //   required this.firebaseAuth,
  // });
  @override
  Stream<Either<User, Failure>> authStateChanges() {
    // TODO: implement authStateChanges
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> confirmPasswordReset(
      String code, String newPassword) {
    // TODO: implement confirmPasswordReset
    throw UnimplementedError();
  }

  @override
  Future<Either<void, Failure>> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> enrollMFA(String phoneNumber) {
    // TODO: implement enrollMFA
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<String, Failure>> getIdToken() {
    // TODO: implement getIdToken
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, Failure>> isEmailVerified() {
    // TODO: implement isEmailVerified
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<void, Failure>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> refreshToken() {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> sendEmailVerification() {
    // TODO: implement sendEmailVerification
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> sendPasswordResetEmail(String email) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> signInWithGithub() {
    // TODO: implement signInWithGithub
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> signInWithTwitter() {
    // TODO: implement signInWithTwitter
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> updateDisplayName(String name) {
    // TODO: implement updateDisplayName
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> updateEmail(String newEmail) {
    // TODO: implement updateEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> updatePassword(String newPassword) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> updateProfilePhoto(String photoUrl) {
    // TODO: implement updateProfilePhoto
    throw UnimplementedError();
  }

  @override
  Future<Either<User, Failure>> verifyMFA(String code) {
    // TODO: implement verifyMFA
    throw UnimplementedError();
  }
}
