import 'package:chat_app/features/user/domain/entities/user_entity.dart';
import 'package:chat_app/features/user/domain/repositoryes/user_repository.dart';

class CreateUserUseCase {
  final UserRepository repository;

  CreateUserUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.createUser(user);
  }
}
