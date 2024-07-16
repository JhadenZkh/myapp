import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
//obtener la instancia de firebaseauth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//obtener el usuario actual

  User? getCurrenthUser() {
    return _firebaseAuth.currentUser;
  }
//login

  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
        try{

          UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
          return userCredential;
        } on FirebaseAuthException catch (e) {
        throw Exception(e.code);
    }
  }
//crear un nuevo usuario
Future<UserCredential> signUpWithEmailPassword(
      String email, String password) async {
        try{

          UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
          return userCredential;
        } on FirebaseAuthException catch (e) {
        throw Exception(e.code);
    }
  }
//cerrar sesion
Future<void> signOut() async {
  try{
    await _firebaseAuth.signOut();
  } on FirebaseAuthException catch (e) {
    throw Exception(e.code);
  }
}

}
