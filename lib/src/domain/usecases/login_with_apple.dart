import '../../core/failure.dart';
import '../../core/types/either.dart';
import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

class LoginWithApple {
  final AuthRepository repository;
  LoginWithApple(this.repository);
  Future<Either<Failure, AppUser>> call() {
    return repository.signInWithApple();
  }
}
