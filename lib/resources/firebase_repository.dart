import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_methods.dart';
import 'package:videocall_test_3rdwheel/models/user.dart';

class FirebaseRepository {
  FirebaseMethods _firebaseMethods = FirebaseMethods();

  //Get current user
  Future<FirebaseUser> getCurrentUser() => _firebaseMethods.getCurrentUser();

  //Sign in
  Future<FirebaseUser> signIn() => _firebaseMethods.signIn();

  //Authenticate user
  Future<bool> authenticateUser(FirebaseUser user) =>
      _firebaseMethods.authenticateUser(user);

  Future<void> addDataToDb(FirebaseUser user) =>
      _firebaseMethods.addDataToDb(user);
  //Sign out
  Future<void> signOut() => _firebaseMethods.signOut();

  //Fetch all users
  Future<List<User>> fetchAllUsers(FirebaseUser user) =>
      _firebaseMethods.fetchAllUsers(user);
}
