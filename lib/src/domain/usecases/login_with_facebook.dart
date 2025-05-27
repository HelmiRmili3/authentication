import '../../core/failure.dart';
import '../../core/types/either.dart';
import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

class LoginWithFacebook {
  final AuthRepository repository;
  LoginWithFacebook(this.repository);
  Future<Either<Failure, AppUser>> call() {
    return repository.signInWithFacebook();
  }
}
