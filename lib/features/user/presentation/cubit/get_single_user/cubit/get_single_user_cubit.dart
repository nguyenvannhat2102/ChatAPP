import 'package:bloc/bloc.dart';
import 'package:chat_app/features/user/domain/entities/user_entity.dart';
import 'package:chat_app/features/user/domain/usecases/user/get_single_user_usecase.dart';
import 'package:equatable/equatable.dart';

part 'get_single_user_state.dart';

class GetSingleUserCubit extends Cubit<GetSingleUserState> {
  final GetSingleUserUseCase getSingleUserUseCase;
  GetSingleUserCubit({required this.getSingleUserUseCase})
      : super(GetSingleUserInitial());

  Future<void> getSingleUser({required String uid}) async {
    emit(GetSingleUserLoading());
    final streamRespose = getSingleUserUseCase.call(uid);
    streamRespose.listen((event) {
      emit(GetSingleUserLoaded(singleUser: event.first));
    });
  }
}
