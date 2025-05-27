import '../../core/failure.dart';
import '../../core/types/either.dart';
import '../entities/app_user.dart';
import '../params/register_params.dart';
import '../repositories/auth_repository.dart';

class Register {
  final AuthRepository repository;
  Register(this.repository);
  Future<Either<Failure, AppUser>> call(RegisterParams params) {
    return repository.register(params);
  }
}
