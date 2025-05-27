import '../../core/failure.dart';
import '../../core/types/either.dart';
import '../repositories/auth_repository.dart';

class DeleteAccount {
  final AuthRepository repository;
  DeleteAccount(this.repository);
  Future<Either<Failure, void>> call() {
    return repository.deleteAccount();
  }
}
