import 'package:chat_app/features/user/domain/entities/contact_entity.dart';
import 'package:chat_app/features/user/domain/repositoryes/user_repository.dart';

class GetDeviceNumberUseCase {
  final UserRepository repository;

  GetDeviceNumberUseCase({required this.repository});

  Future<List<ContactEntity>> call() {
    return repository.getDeviceNumber();
  }
}
