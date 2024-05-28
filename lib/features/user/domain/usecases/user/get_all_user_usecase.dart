import 'package:chat_app/features/user/domain/entities/user_entity.dart';
import 'package:chat_app/features/user/domain/repositoryes/user_repository.dart';

class GetAllUserUseCase {
  final UserRepository repository;

  GetAllUserUseCase({required this.repository});

  Stream<List<UserEntity>> call() {
    return repository.getAllUsers();
  }
}
