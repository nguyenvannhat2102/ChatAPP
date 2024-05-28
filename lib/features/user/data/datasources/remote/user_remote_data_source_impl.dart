import 'package:chat_app/features/app/const/app_const.dart';
import 'package:chat_app/features/app/const/firebase_collection_const.dart';
import 'package:chat_app/features/user/data/datasources/remote/user_remote_data_source.dart';
import 'package:chat_app/features/user/data/models/user_model.dart';
import 'package:chat_app/features/user/domain/entities/contact_entity.dart';
import 'package:chat_app/features/user/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  UserRemoteDataSourceImpl({required this.auth, required this.firestore});

  String _verificationId = "";

  @override
  Future<void> createUser(UserEntity user) async {
    final userCollection = firestore.collection(FirebaseCollectionConst.user);
    final uid = await getCurrentID();
    final newUser = UserModel(
      email: user.email,
      isOnline: user.isOnline,
      phoneNumber: user.phoneNumber,
      profileUrl: user.profileUrl,
      status: user.status,
      username: user.username,
      uid: uid,
    ).toDocument();

    try {
      userCollection.doc(uid).get().then((userDoc) {
        if (!userDoc.exists) {
          userCollection.doc(uid).set(newUser);
        } else {
          userCollection.doc(uid).update(newUser);
        }
      });
    } catch (e) {
      throw Exception("Error orcur while creating user");
    }
  }

  @override
  Stream<List<UserEntity>> getAllUsers() {
    final userCollection = firestore.collection(FirebaseCollectionConst.user);
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  Future<String> getCurrentID() async => auth.currentUser!.uid;

  @override
  Future<List<ContactEntity>> getDeviceNumber() async {
    List<ContactEntity> contacts = [];
    final getContactsData = await ContactsService.getContacts();
    getContactsData.forEach((myContact) {
      myContact.phones!.forEach((element) {
        contacts.add(ContactEntity(
            element.value, myContact.displayName, "", "", myContact.avatar));
      });
    });
    return contacts;
  }

  @override
  Stream<List<UserEntity>> getSingleUser(String uid) {
    final userCollection = firestore
        .collection(FirebaseCollectionConst.user)
        .where("uid", isEqualTo: uid);
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  // ignore: unnecessary_null_comparison
  Future<bool> isSignIn() async => auth.currentUser!.uid != null;

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsPinCode,
      );
      await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        toast("Invalid Verification Code");
      } else if (e.code == 'quota-exceeded') {
        toast("SMS quota-exceeded");
      }
    } catch (e) {
      toast("Unknown exception please try again");
    }
  }

  @override
  Future<void> signOut() async => auth.signOut();

  @override
  Future<void> updateUser(UserEntity user) async {
    final userCollection = firestore.collection(FirebaseCollectionConst.user);

    Map<String, dynamic> userInfo = {};
    if (user.username != "" && user.username != null) {
      userInfo['username'] = user.username;
    }

    if (user.profileUrl != "" && user.profileUrl != null) {
      userInfo['profileUrl'] = user.profileUrl;
    }

    if (user.isOnline != null) {
      userInfo['isOnline'] = user.isOnline;
    }

    userCollection.doc(user.uid).update(userInfo);
  }

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    phoneVerificationCompleted(AuthCredential authCredential) {
      print(
          "phone verified : Token ${authCredential.token} ${authCredential.signInMethod}");
    }

    phoneVerificationFailed(FirebaseAuthException firebaseAuthException) {
      print(
          "phone failed :  ${firebaseAuthException.message}, ${firebaseAuthException.code}");
    }

    phoneCodeAutoRetrievalTimeout(String verificationID) {
      _verificationId = verificationID;
      print("time out :$verificationID");
    }

    phoneCodeSent(String verificationId, int? forceResendingToken) {
      _verificationId = verificationId;
    }

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: phoneVerificationCompleted,
      verificationFailed: phoneVerificationFailed,
      timeout: const Duration(seconds: 60),
      codeSent: phoneCodeSent,
      codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout,
    );
  }
}
