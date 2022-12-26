import 'package:blog/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async {
    return this;
  }

  createUser(emailAddress, password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  loginUser(emailAddress, password) async {
    final userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: password);
    final user = userCredential.user;
  }

  userNullCheck() {
    if (FirebaseAuth.instance.currentUser != null) {
      Get.toNamed(Routes.HOME);
    } else {
      Get.toNamed(Routes.LOGIN);
    }
  }
}
