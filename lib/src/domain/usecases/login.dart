import '../../core/failure.dart';
import '../../core/types/either.dart';
import '../entities/app_user.dart';
import '../params/login_params.dart';
import '../repositories/auth_repository.dart';

class Login {
  final AuthRepository repository;
  Login(this.repository);
  Future<Either<Failure, AppUser>> call(LoginParams params) {
    return repository.login(params);
  }
}
