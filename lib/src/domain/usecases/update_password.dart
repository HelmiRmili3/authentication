import '../../core/failure.dart';
import '../../core/types/either.dart';
import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

class UpdatePassword {
  final AuthRepository repository;
  UpdatePassword(this.repository);
  Future<Either<Failure, AppUser>> call(String params) {
    return repository.updatePassword(params);
  }
}
