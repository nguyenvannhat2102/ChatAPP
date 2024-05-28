import 'package:chat_app/features/user/domain/repositoryes/user_repository.dart';

class GetCurrentUidUseCase {
  final UserRepository repository;

  GetCurrentUidUseCase({required this.repository});

  Future<String> call() async {
    return repository.getCurrentID();
  }
}
