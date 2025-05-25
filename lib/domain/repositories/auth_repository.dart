import 'package:authentication/data/core/types/either.dart';

import '../../data/core/failure.dart';
import '../entities/user.dart';

abstract class AuthRepository {
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
