import 'package:chat_app/features/user/data/datasources/remote/user_remote_data_source.dart';
import 'package:chat_app/features/user/domain/entities/contact_entity.dart';
import 'package:chat_app/features/user/domain/entities/user_entity.dart';
import 'package:chat_app/features/user/domain/repositoryes/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> createUser(UserEntity user) => remoteDataSource.createUser(user);

  @override
  Stream<List<UserEntity>> getAllUsers() => remoteDataSource.getAllUsers();

  @override
  Future<String> getCurrentID() => remoteDataSource.getCurrentID();

  @override
  Future<List<ContactEntity>> getDeviceNumber() =>
      remoteDataSource.getDeviceNumber();

  @override
  Stream<List<UserEntity>> getSingleUser(String uid) =>
      remoteDataSource.getSingleUser(uid);

  @override
  Future<bool> isSignIn() => remoteDataSource.isSignIn();

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) =>
      remoteDataSource.signInWithPhoneNumber(smsPinCode);

  @override
  Future<void> signOut() => remoteDataSource.signOut();

  @override
  Future<void> updateUser(UserEntity user) => remoteDataSource.updateUser(user);

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) =>
      remoteDataSource.verifyPhoneNumber(phoneNumber);
}
