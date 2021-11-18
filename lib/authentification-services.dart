import 'package:firebase_auth/firebase_auth.dart';

class AuthentificationService {
  final FirebaseAuth _firebaseAuth;

  AuthentificationService(this._firebaseAuth);

  Stream<User> get authStateChange => _firebaseAuth.authStateChange();
  Future <String> signIn ({ String email, String password}) async {
  try {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return "ok connécté";
  }
  on FirebaseAuthException catch (e) {
    return e.message();
  }
  }

  Future <String> SignUp ({ String email, String password}) async {
  try {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return "ok créer";
  }
  on FirebaseAuthException catch (e){
    return e.message();
  }
  }
}