import 'package:firebase_auth/firebase_auth.dart';

class AuthUtil {
  static AuthUtil _instance = null;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthUtil._();

  factory AuthUtil() {
    if (_instance == null) {
      _instance = AuthUtil._();
    }
    return _instance;
  }
  Future<FirebaseUser> currentUser() => _auth.currentUser();
  Future<bool> isLoggedIn() => currentUser().then((u) => u != null);

  Future<FirebaseUser> signUp(String email, String password) async {
    var resp = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return resp.user;
  }
}