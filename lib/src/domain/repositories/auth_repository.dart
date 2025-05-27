import 'package:authentication/src/core/types/either.dart';
import 'package:authentication/src/domain/params/login_params.dart';
import 'package:authentication/src/domain/params/register_params.dart';

import '../../core/failure.dart';
import '../entities/app_user.dart';
import '../params/reset_password_params.dart';

abstract class AuthRepository {
  // ✅ Basic Auth
  Future<Either<Failure, AppUser>> login(LoginParams params);
  Future<Either<Failure, AppUser>> register(RegisterParams params);
  Future<Either<Failure, void>> logout();

  // 👤 User Info
  Future<Either<Failure, AppUser>> getCurrentUser();
  Stream<Either<Failure, AppUser>> authStateChanges();

  // ✅ Email Verification
  Future<Either<Failure, AppUser>> sendEmailVerification();
  Future<Either<Failure, bool>> isEmailVerified();

  // 🔁 Password Management
  Future<Either<Failure, AppUser>> sendPasswordResetEmail(String email);
  Future<Either<Failure, AppUser>> confirmPasswordReset(
      ResetPasswordParams params);
  Future<Either<Failure, AppUser>> updatePassword(String newPassword);

  // ✏️ Profile Management

  // 🧪 Token Management (for server API calls)
  Future<Either<Failure, String>> getIdToken();
  Future<Either<Failure, AppUser>> refreshToken();

  // 🔐 Multi-Provider Support (optional)
  Future<Either<Failure, AppUser>> signInWithGoogle();
  Future<Either<Failure, AppUser>> signInWithFacebook();
  Future<Either<Failure, AppUser>> signInWithApple();
  Future<Either<Failure, AppUser>> signInWithTwitter();
  Future<Either<Failure, AppUser>> signInWithGithub();

  // 🧾 Account Deletion
  Future<Either<Failure, void>> deleteAccount();

  // 🛡️ MFA (Optional)
  Future<Either<Failure, AppUser>> enrollMFA(String phoneNumber);
  Future<Either<Failure, AppUser>> verifyMFA(String code);
}
