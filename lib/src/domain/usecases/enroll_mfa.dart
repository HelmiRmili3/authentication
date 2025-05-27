import '../../core/failure.dart';
import '../../core/types/either.dart';
import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

class EnrollMfa {
  final AuthRepository repository;
  EnrollMfa(this.repository);
  Future<Either<Failure, AppUser>> call(String phoneNumber) {
    return repository.enrollMFA(phoneNumber);
  }
}
