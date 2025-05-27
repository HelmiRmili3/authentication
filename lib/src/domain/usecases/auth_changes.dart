import '../../core/failure.dart';
import '../../core/types/either.dart';
import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

class AuthStateChanges {
  final AuthRepository repository;
  AuthStateChanges(this.repository);
  Stream<Either<Failure, AppUser>> call() {
    return repository.authStateChanges();
  }
}
