import '../../core/failure.dart';
import '../../core/types/either.dart';
import '../entities/app_user.dart';
import '../params/reset_password_params.dart';
import '../repositories/auth_repository.dart';

class ConfirmePasswordRest {
  final AuthRepository repository;
  ConfirmePasswordRest(this.repository);
  Future<Either<Failure, AppUser>> call(ResetPasswordParams params) {
    return repository.confirmPasswordReset(params);
  }
}
