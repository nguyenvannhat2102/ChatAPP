import 'package:chat_app/features/user/domain/entities/user_entity.dart';
import 'package:chat_app/features/user/domain/repositoryes/user_repository.dart';

class UpdateUserUseCase {
  final UserRepository repository;

  UpdateUserUseCase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.updateUser(user);
  }
}
