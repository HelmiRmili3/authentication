import '../../core/failure.dart';
import '../../core/types/either.dart';
import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

class GetCurrentUser {
  final AuthRepository _repository;
  GetCurrentUser(this._repository);
  Future<Either<Failure, AppUser>> call() async {
    return await _repository.getCurrentUser();
  }
}
