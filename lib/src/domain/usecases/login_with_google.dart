import '../../core/failure.dart';
import '../../core/types/either.dart';
import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

class LoginWithGoogle {
  final AuthRepository repository;
  LoginWithGoogle(this.repository);
  Future<Either<Failure, AppUser>> call() {
    return repository.signInWithGoogle();
  }
}
