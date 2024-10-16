import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_lab/app/colors/colors.dart';
import 'package:flavour_lab/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  var isEmailValid = true.obs;
  var isPassValid = true.obs;
  var isObscure = true.obs;

  var emailError = RxnString();
  var passwordError = RxnString();

  void validateEmail() {
    String email = emailC.text;
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(pattern);

    if (email.isEmpty) {
      isEmailValid.value = false;
      emailError.value = "Email cannot be empty!";
    } else if (!regExp.hasMatch(email)) {
      isEmailValid.value = false;
      emailError.value = "Invalid format!";
    } else {
      isEmailValid.value = true;
      emailError.value = null;
    }
  }

  void validatePassword() {
    String pass = passC.text;
    if (pass.isEmpty) {
      passwordError.value = 'Email cannot be empty!';
    } else if (pass.length < 8) {
      passwordError.value = 'At least 8 characters';
    } else {
      passwordError.value = null;
    }
  }

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  LoginController() {
    emailC.addListener(() {
      validateEmail();
    });
    passC.addListener(() {
      validatePassword();
    });
  }

  void validateAndLogin() {
    isEmailValid.value = emailC.text.isNotEmpty;
    isPassValid.value = passC.text.isNotEmpty && passC.text.length >= 8;

    if (!isEmailValid.value || !isPassValid.value) {
      customDialog(
        false,
        null,
      );
    } else {
      loginauth(
        emailC.text,
        passC.text,
      );
    }
  }

  void loginauth(String email, String password) async {
    loading();
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.back();
      customDialog(true, null);
    } on FirebaseAuthException catch (e) {
      Get.back();
      String errorMessage = _getErrorMessage(e.code);
      customDialog(false, errorMessage);
    }
  }

  void customDialog(bool isSuccess, String? content) {
    final String title = isSuccess ? "Login Successful" : "Oops!";
    final String dialogContent = isSuccess
        ? "You’re in! Let’s get started."
        : content ??
            "Something went wrong. Please check your input and try again.";
    final String buttonContent = isSuccess ? "Let's go" : "Oke";
    final String iconPath =
        isSuccess ? 'assets/icons/success.png' : 'assets/icons/error.png';
    final Color myColor = isSuccess ? Colors.green : Colors.red;

    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Column(
          children: [
            Image.asset(
              iconPath,
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 25),
            Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(
                fontSize: 30,
                color: myColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'myfont',
              ),
            ),
            const SizedBox(height: 15),
            Text(
              dialogContent,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'myfont',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              if (isSuccess) {
                Get.offAllNamed(Routes.HOME);
              }
              Get.back();
            },
            child: Text(
              buttonContent,
              style: TextStyle(color: myColor, fontFamily: 'myfont'),
            ),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  void loading() {
    Get.dialog(
      const Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: LoadingIndicator(
            indicatorType: Indicator.ballSpinFadeLoader,
            colors: [green],
            strokeWidth: 2,
            backgroundColor: Colors.transparent,
            pathBackgroundColor: Colors.transparent,
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  String _getErrorMessage(String errorCode) {
    final errorMessages = {
      'invalid-credential': 'Incorrect email or password.',
      'channel-error': 'Please fill in all the details!',
      'wrong-password': 'Oops, wrong password.',
      'invalid-email': 'Invalid email address.',
      'weak-password': 'Your password is too weak.',
      'email-already-in-use': 'This email is already in use.',
      'The email address is badly formatted': 'The email format looks off.'
    };
    return errorMessages[errorCode] ?? 'Something went wrong: $errorCode';
  }
}
