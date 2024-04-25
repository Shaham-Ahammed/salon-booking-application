import 'package:firebase_auth/firebase_auth.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/login_screen_constants.dart';
import 'package:trim_spot_barber_side/utils/registration_page/textediting_controllers.dart';

class FirebaseAuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword() async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: registrationEmailController.text.trim(),
          password: registrationPasswordController.text.trim());
      return credential.user;
    } catch (e) {
      print("some error $e");
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword() async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: loginEmailController.text.trim(),
          password: loginPasswordController.text.trim());
      return credential.user;
    } catch (e) {
      print("some error $e");
      return null;
    }
  }
}
