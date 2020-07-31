import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_methods.dart';

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
}
