import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onReady() {
    firebaseUser.bindStream(_auth.authStateChanges());
    super.onReady();
  }

  void register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Success", "Account Created");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Success", "Login Successful");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void logout() async {
    await _auth.signOut();
  }
}
