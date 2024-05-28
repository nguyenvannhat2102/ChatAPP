import 'package:bloc/bloc.dart';
import 'package:chat_app/features/user/domain/usecases/credential/get_current_uid_usecase.dart';
import 'package:chat_app/features/user/domain/usecases/credential/is_sign_in_usecase.dart';
import 'package:chat_app/features/user/domain/usecases/credential/sign_out_usecase.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetCurrentUidUseCase getCurrentUidUseCase;
  final IsSignInUseCase isSignInUseCase;
  final SignOutUseCase signOutUseCase;

  AuthCubit(
      {required this.getCurrentUidUseCase,
      required this.isSignInUseCase,
      required this.signOutUseCase})
      : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      bool isSigIn = await isSignInUseCase.call();
      if (isSigIn) {
        final uid = await getCurrentUidUseCase.call();
        emit(Authenticated(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(UnAuthenticated());
    }
  }

  Future<void> LoggedIn() async {
    try {
      final uid = await getCurrentUidUseCase.call();
      emit(Authenticated(uid: uid));
    } catch (e) {
      emit(UnAuthenticated());
    }
  }

  Future<void> LoggedOut() async {
    try {
      await signOutUseCase.call();
      emit(UnAuthenticated());
    } catch (e) {
      emit(UnAuthenticated());
    }
  }
}
