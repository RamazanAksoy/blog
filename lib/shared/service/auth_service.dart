import 'package:blog/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async {
    return this;
  }

  Future<User?> createUser(emailAddress, password) async {
    try {
      return (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      ))
          .user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("weak-password", "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("email-already-in-use", "The account already exists for that email.");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<User?> loginUser(emailAddress, password) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: password);
      return userCredential.user;
    } catch (e) {}
    return null;
  }

  userNullCheck() {
    if (FirebaseAuth.instance.currentUser != null) {
      Get.toNamed(Routes.BLOGADD);
    } else {
      Get.toNamed(Routes.HOME);
    }
  }
}
