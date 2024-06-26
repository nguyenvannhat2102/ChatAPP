import 'package:chat_app/features/user/domain/repositoryes/user_repository.dart';

class IsSignInUseCase {
  final UserRepository repository;

  IsSignInUseCase({required this.repository});

  Future<bool> call() async {
    return repository.isSignIn();
  }
}
