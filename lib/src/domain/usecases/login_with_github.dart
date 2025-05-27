import '../../core/failure.dart';
import '../../core/types/either.dart';
import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

class LoginWithGithub {
  final AuthRepository repository;
  LoginWithGithub(this.repository);
  Future<Either<Failure, AppUser>> call() {
    return repository.signInWithGithub();
  }
}
