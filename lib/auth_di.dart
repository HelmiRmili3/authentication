import 'package:authentication/src/domain/usecases/confirme_password_rest.dart';
import 'package:authentication/src/domain/usecases/enroll_mfa.dart';
import 'package:authentication/src/domain/usecases/login_with_apple.dart';
import 'package:authentication/src/domain/usecases/login_with_facebook.dart';
import 'package:authentication/src/domain/usecases/login_with_github.dart';
import 'package:authentication/src/domain/usecases/login_with_google.dart';
import 'package:authentication/src/domain/usecases/login_with_twitter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'src/data/datasources/auth_remote_data_source.dart';
import 'src/data/repositories/auth_repository_impl.dart';
import 'src/domain/repositories/auth_repository.dart';

import 'src/domain/usecases/login.dart';
import 'src/domain/usecases/register.dart';
import 'src/domain/usecases/logout.dart';
import 'src/domain/usecases/get_current_user.dart';
import 'src/domain/usecases/send_email_verification.dart';
import 'src/domain/usecases/is_email_verified.dart';

import 'src/domain/usecases/update_password.dart';

import 'src/domain/usecases/delete_account.dart';
import 'src/presentation/bloc/authentication_bloc.dart';

final sl = GetIt.instance;

void initAuthModule() {
  // Repository
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl(), sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Usecases
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => Register(sl()));
  sl.registerLazySingleton(() => Logout(sl()));
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => SendEmailVerification(sl()));
  sl.registerLazySingleton(() => IsEmailVerified(sl()));
  sl.registerLazySingleton(() => SendEmailVerification(sl()));
  sl.registerLazySingleton(() => ConfirmePasswordRest(sl()));
  sl.registerLazySingleton(() => UpdatePassword(sl()));
  sl.registerLazySingleton(() => LoginWithApple(sl()));
  sl.registerLazySingleton(() => LoginWithFacebook(sl()));
  sl.registerLazySingleton(() => LoginWithGoogle(sl()));
  sl.registerLazySingleton(() => LoginWithTwitter(sl()));
  sl.registerLazySingleton(() => LoginWithGithub(sl()));
  sl.registerLazySingleton(() => DeleteAccount(sl()));
  sl.registerLazySingleton(() => EnrollMfa(sl()));
  // sl.registerLazySingleton(() => (sl()));

  // Controller
  // sl.registerLazySingleton(() => AuthController(sl(), sl()));

  // Bloc
  sl.registerFactory(() => AuthBloc(
        login: sl(),
        register: sl(),
        logout: sl(),
        getCurrentUser: sl(),
        sendEmailVerification: sl(),
        isEmailVerified: sl(),
        sendPasswordResetEmail: sl(),
        confirmPasswordReset: sl(),
        updatePassword: sl(),
        loginWithGoogle: sl(),
        loginWithFacebook: sl(),
        loginWithApple: sl(),
        loginWithTwitter: sl(),
        loginWithGithub: sl(),
        deleteAccount: sl(),
        enrollMFA: sl(),
        // verifyMFA: sl(),
      ));
}
