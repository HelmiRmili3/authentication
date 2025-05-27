import 'package:firebase_auth/firebase_auth.dart';

import '../../../auth.dart';
import '../../core/failure.dart';
import '../../core/types/either.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/params/login_params.dart';
import '../../domain/params/register_params.dart';
import '../../domain/params/reset_password_params.dart';

abstract class AuthRemoteDataSource {
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
  Future<Either<Failure, AppUser>> updateDisplayName(String name);
  Future<Either<Failure, AppUser>> updateEmail(String newEmail);
  Future<Either<Failure, AppUser>> updateProfilePhoto(String photoUrl);

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

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final LocalizationProvider _localizationProvider;

  AuthRemoteDataSourceImpl(
    this._firebaseAuth,
    this._localizationProvider,
  );

  @override
  Stream<Either<Failure, AppUser>> authStateChanges() {
    return _firebaseAuth.authStateChanges().map((User? firebaseUser) {
      if (firebaseUser == null) {
        // No user signed in, you can emit a failure or a left with null user based on your logic
        // For example, here we emit a Failure indicating no user signed in:
        return Left(FirebaseAuthFailure(_localizationProvider.profileTitle));
      } else {
        // Map firebaseUser to your AppUser entity
        final appUser = AppUser(
          uid: firebaseUser.uid,
          email: firebaseUser.email,
          displayName: firebaseUser.displayName,
          photoUrl: firebaseUser.photoURL,
          phoneNumber: firebaseUser.phoneNumber,
          emailVerified: firebaseUser.emailVerified,
        );
        return Right(appUser);
      }
    });
  }

  @override
  Future<Either<Failure, AppUser>> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AppUser>> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AppUser>> signInWithGithub() {
    // TODO: implement signInWithGithub
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AppUser>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AppUser>> signInWithTwitter() {
    // TODO: implement signInWithTwitter
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AppUser>> confirmPasswordReset(
      ResetPasswordParams params) async {
    try {
      await FirebaseAuth.instance.confirmPasswordReset(
          code: params.code, newPassword: params.newPassword);

      final firebaseUser = _firebaseAuth.currentUser;
      if (firebaseUser != null) {
        final user = AppUser.fromFirebaseUser(firebaseUser);
        return Right(user);
      } else {
        return const Left(
            FirebaseAuthFailure('No user is currently signed in.'));
      }
    } catch (e) {
      return Left(FirebaseAuthFailure('Failed to confirm password reset: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return const Left(
            FirebaseAuthFailure('No user is currently signed in.'));
      }
      await user.delete();
      return const Right(null);
    } catch (e) {
      return Left(FirebaseAuthFailure('Failed to delete account: $e'));
    }
  }

  @override
  Future<Either<Failure, AppUser>> getCurrentUser() async {
    try {
      final firebaseUser = _firebaseAuth.currentUser;
      if (firebaseUser != null) {
        final user = AppUser.fromFirebaseUser(firebaseUser);
        return Right(user);
      } else {
        return const Left(
            FirebaseAuthFailure('No user is currently signed in.'));
      }
    } catch (e) {
      return Left(FirebaseAuthFailure('Failed to get current user: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> getIdToken() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        final token = await user.getIdToken();
        return Right(token!);
      } else {
        return const Left(
            FirebaseAuthFailure('No user is currently signed in.'));
      }
    } catch (e) {
      return Left(FirebaseAuthFailure('Failed to get ID token: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> isEmailVerified() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.reload();
        final refreshedUser = _firebaseAuth.currentUser;
        return Right(refreshedUser!.emailVerified);
      } else {
        return const Left(
            FirebaseAuthFailure('No user is currently signed in.'));
      }
    } catch (e) {
      return Left(
          FirebaseAuthFailure('Failed to check email verification: $e'));
    }
  }

  @override
  Future<Either<Failure, AppUser>> login(LoginParams params) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      final user = credential.user;
      if (user != null) {
        return Right(AppUser.fromFirebaseUser(user));
      } else {
        return const Left(
            FirebaseAuthFailure('Login failed: No user returned.'));
      }
    } catch (e) {
      return Left(FirebaseAuthFailure('Login failed: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _firebaseAuth.signOut();
      return const Right(null);
    } catch (e) {
      return Left(FirebaseAuthFailure('Logout failed: $e'));
    }
  }

  @override
  Future<Either<Failure, AppUser>> refreshToken() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.getIdToken(true);
        return Right(AppUser.fromFirebaseUser(user));
      } else {
        return const Left(
            FirebaseAuthFailure('No user is currently signed in.'));
      }
    } catch (e) {
      return Left(FirebaseAuthFailure('Token refresh failed: $e'));
    }
  }

  @override
  Future<Either<Failure, AppUser>> register(RegisterParams params) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      final user = credential.user;
      if (user != null) {
        return Right(AppUser.fromFirebaseUser(user));
      } else {
        return const Left(
            FirebaseAuthFailure('Registration failed: No user returned.'));
      }
    } catch (e) {
      return Left(FirebaseAuthFailure('Registration failed: $e'));
    }
  }

  @override
  Future<Either<Failure, AppUser>> sendEmailVerification() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.sendEmailVerification();
        return Right(AppUser.fromFirebaseUser(user));
      } else {
        return const Left(
            FirebaseAuthFailure('No user is currently signed in.'));
      }
    } catch (e) {
      return Left(FirebaseAuthFailure('Failed to send email verification: $e'));
    }
  }

  @override
  @override
  Future<Either<Failure, AppUser>> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        return Right(AppUser.fromFirebaseUser(user));
      } else {
        return const Left(FirebaseAuthFailure(
            'Password reset email sent, but no user is currently signed in.'));
      }
    } catch (e) {
      return Left(
          FirebaseAuthFailure('Failed to send password reset email: $e'));
    }
  }

  @override
  Future<Either<Failure, AppUser>> updateDisplayName(String name) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.updateDisplayName(name);
        await user.reload();
        final updatedUser = _firebaseAuth.currentUser;
        if (updatedUser != null) {
          return Right(AppUser.fromFirebaseUser(updatedUser));
        } else {
          return const Left(
              FirebaseAuthFailure('Failed to retrieve updated user.'));
        }
      } else {
        return const Left(
            FirebaseAuthFailure('No user is currently signed in.'));
      }
    } catch (e) {
      return Left(FirebaseAuthFailure('Failed to update display name: $e'));
    }
  }

  @override
  Future<Either<Failure, AppUser>> updateEmail(String newEmail) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.verifyBeforeUpdateEmail(newEmail);
        await user.reload();
        final updatedUser = _firebaseAuth.currentUser;
        if (updatedUser != null) {
          return Right(AppUser.fromFirebaseUser(updatedUser));
        } else {
          return const Left(
              FirebaseAuthFailure('Failed to retrieve updated user.'));
        }
      } else {
        return const Left(
            FirebaseAuthFailure('No user is currently signed in.'));
      }
    } catch (e) {
      return Left(FirebaseAuthFailure('Failed to update email: $e'));
    }
  }

  @override
  Future<Either<Failure, AppUser>> updatePassword(String newPassword) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
        await user.reload();
        final updatedUser = _firebaseAuth.currentUser;
        if (updatedUser != null) {
          return Right(AppUser.fromFirebaseUser(updatedUser));
        } else {
          return const Left(
              FirebaseAuthFailure('Failed to retrieve updated user.'));
        }
      } else {
        return const Left(
            FirebaseAuthFailure('No user is currently signed in.'));
      }
    } catch (e) {
      return Left(FirebaseAuthFailure('Failed to update password: $e'));
    }
  }

  @override
  Future<Either<Failure, AppUser>> updateProfilePhoto(String photoUrl) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.updatePhotoURL(photoUrl);
        await user.reload();
        final updatedUser = _firebaseAuth.currentUser;
        if (updatedUser != null) {
          return Right(AppUser.fromFirebaseUser(updatedUser));
        } else {
          return const Left(
              FirebaseAuthFailure('Failed to retrieve updated user.'));
        }
      } else {
        return const Left(
            FirebaseAuthFailure('No user is currently signed in.'));
      }
    } catch (e) {
      return Left(FirebaseAuthFailure('Failed to update profile photo: $e'));
    }
  }

  @override
  Future<Either<Failure, AppUser>> verifyMFA(String code) {
    // TODO: implement verifyMFA
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AppUser>> enrollMFA(String phoneNumber) {
    // TODO: implement enrollMFA
    throw UnimplementedError();
  }
}
