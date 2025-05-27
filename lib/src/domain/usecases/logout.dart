import '../../core/failure.dart';
import '../../core/types/either.dart';
import '../repositories/auth_repository.dart';

class Logout {
  final AuthRepository repository;
  Logout(this.repository);
  Future<Either<Failure, void>> call() {
    return repository.logout();
  }
}
