import 'package:get/get.dart';

class AuthController extends GetxController {
  // Observable variables for authentication state
  var isLoggedIn = false.obs;

  // Method to log in the user
  void login() {
    isLoggedIn.value = true;
    print('User logged in');
  }

  // Method to log out the user
  void logout() {
    isLoggedIn.value = false;
  }
}
