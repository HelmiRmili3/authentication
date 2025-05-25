// // lib/auth_di.dart
// import 'package:get_it/get_it.dart';
// import 'data/repositories/firebase_auth_repository.dart';
// import 'domain/repositories/auth_repository.dart';
// import 'domain/repositories/auth_repositoy.dart';
// import 'domain/usecases/login.dart';
// import 'domain/usecases/register.dart';
// import 'presentation/controllers/auth_controller.dart';

// final sl = GetIt.instance;

// void initAuthModule() {
//   // Repositories
//   sl.registerLazySingleton<AuthRepository>(() => FirebaseAuthRepository());

//   // Usecases
//   sl.registerLazySingleton(() => Login(sl()));
//   sl.registerLazySingleton(() => Register(sl()));

//   // Controller / Bloc / Cubit
//   sl.registerLazySingleton(() => AuthController(sl(), sl()));
// }
