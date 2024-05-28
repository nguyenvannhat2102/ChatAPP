import 'package:chat_app/features/user/data/datasources/remote/user_remote_data_source.dart';
import 'package:chat_app/features/user/data/datasources/remote/user_remote_data_source_impl.dart';
import 'package:chat_app/features/user/data/repositories/user_repository_impl.dart';
import 'package:chat_app/features/user/domain/repositoryes/user_repository.dart';
import 'package:chat_app/features/user/domain/usecases/credential/get_current_uid_usecase.dart';
import 'package:chat_app/features/user/domain/usecases/credential/is_sign_in_usecase.dart';
import 'package:chat_app/features/user/domain/usecases/credential/sign_in_with_phone_number_usecase.dart';
import 'package:chat_app/features/user/domain/usecases/credential/sign_out_usecase.dart';
import 'package:chat_app/features/user/domain/usecases/credential/verify_phone_number.dart';
import 'package:chat_app/features/user/domain/usecases/user/create_user_usecase.dart';
import 'package:chat_app/features/user/domain/usecases/user/get_all_user_usecase.dart';
import 'package:chat_app/features/user/domain/usecases/user/get_device_number_usecase.dart';
import 'package:chat_app/features/user/domain/usecases/user/get_single_user_usecase.dart';
import 'package:chat_app/features/user/domain/usecases/user/update_user_usecase.dart';
import 'package:chat_app/features/user/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:chat_app/features/user/presentation/cubit/credential/cubit/credential_cubit.dart';
import 'package:chat_app/features/user/presentation/cubit/get_device_number/cubit/get_device_number_cubit.dart';
import 'package:chat_app/features/user/presentation/cubit/get_single_user/cubit/get_single_user_cubit.dart';
import 'package:chat_app/features/user/presentation/cubit/user/cubit/user_cubit.dart';
import 'package:chat_app/main_injection_container.dart';

Future<void> userInjectionContainer() async {
  // Cubit injection
  sl.registerFactory<AuthCubit>(() => AuthCubit(
        getCurrentUidUseCase: sl.call(),
        isSignInUseCase: sl.call(),
        signOutUseCase: sl.call(),
      ));

  sl.registerFactory<UserCubit>(() => UserCubit(
        updateUserUseCase: sl.call(),
        getAllUsersUseCase: sl.call(),
      ));

  sl.registerFactory<GetSingleUserCubit>(() => GetSingleUserCubit(
        getSingleUserUseCase: sl.call(),
      ));

  sl.registerFactory<CredentialCubit>(() => CredentialCubit(
        createUserUseCase: sl.call(),
        signInWithPhoneNumberUseCase: sl.call(),
        verifyPhoneNumberUseCase: sl.call(),
      ));

  sl.registerFactory<GetDeviceNumberCubit>(() => GetDeviceNumberCubit(
        getDeviceNumberUseCase: sl.call(),
      ));

  // user case ịnection
  sl.registerLazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCase(repository: sl.call()));

  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));

  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));

  sl.registerLazySingleton<CreateUserUseCase>(
      () => CreateUserUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetAllUserUseCase>(
      () => GetAllUserUseCase(repository: sl.call()));

  sl.registerLazySingleton<UpdateUserUseCase>(
      () => UpdateUserUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetSingleUserUseCase>(
      () => GetSingleUserUseCase(repository: sl.call()));

  sl.registerLazySingleton<SignInWithPhoneNumberUseCase>(
      () => SignInWithPhoneNumberUseCase(repository: sl.call()));

  sl.registerLazySingleton<VerifyPhoneNumberUseCase>(
      () => VerifyPhoneNumberUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetDeviceNumberUseCase>(
      () => GetDeviceNumberUseCase(repository: sl.call()));

  // repository and  data sources ịnection

  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl.call()));

  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(
        auth: sl.call(),
        firestore: sl.call(),
      ));
}
