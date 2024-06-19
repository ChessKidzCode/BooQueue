import 'package:firebase_auth/firebase_auth.dart';
import 'package:netninjapp/services/database.dart';
import '../models/user.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // auth change user Stream
  Stream<AnonUser?> get user{
    return _auth.authStateChanges().map((User? user) {
      if (user == null){
        return null;
      }
      return userFromFireBaseUser(user);
    },);
  }

  AnonUser userFromFireBaseUser(User user){
    return AnonUser(user.uid);
  }
  // sign in anonimously
  Future signInAnon()async {
    try {
      final UserCredential userCredentials = await _auth.signInAnonymously();
      return userCredentials.user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  // sign in 

  Future signInEmailPassword(String email, String password) async {
    try {
      UserCredential userCredentials = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredentials.user;

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // register
  Future registerEmailPassword(String email, String password) async {
    try {
      UserCredential userCredentials = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await DatabaseService(uid: userCredentials.user!.uid).updateUserData( '100','new_crew_member', 100, '2024/01/01', "Kota Mince",);
      return userCredentials.user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}