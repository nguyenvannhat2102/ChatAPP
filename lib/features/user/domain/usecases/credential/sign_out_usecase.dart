import 'package:chat_app/features/user/domain/repositoryes/user_repository.dart';

class SignOutUseCase {
  final UserRepository repository;

  SignOutUseCase({required this.repository});

  Future<void> call() async {
    return repository.signOut();
  }
}
