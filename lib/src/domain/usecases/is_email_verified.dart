import '../../core/failure.dart';
import '../../core/types/either.dart';
import '../repositories/auth_repository.dart';

class IsEmailVerified {
  final AuthRepository repository;
  IsEmailVerified(this.repository);
  Future<Either<Failure, bool>> call() {
    return repository.isEmailVerified();
  }
}
