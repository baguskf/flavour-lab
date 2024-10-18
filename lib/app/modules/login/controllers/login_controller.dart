import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_lab/app/colors/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flavour_lab/app/widget/widget.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailC = TextEditingController();
  TextEditingController resetC = TextEditingController();
  TextEditingController passC = TextEditingController();

  var isEmailValid = true.obs;
  var isResetValid = true.obs;
  var isPassValid = true.obs;
  var isObscure = true.obs;

  var emailError = RxnString();
  var resetError = RxnString();
  var passwordError = RxnString();

  void validateReset() {
    String email = resetC.text;
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(pattern);

    if (email.isEmpty) {
      isResetValid.value = false;
      resetError.value = "Email cannot be empty!";
    } else if (!regExp.hasMatch(email)) {
      isResetValid.value = false;
      resetError.value = "Invalid format!";
    } else {
      isResetValid.value = true;
      resetError.value = null;
    }
  }

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

  LoginController() {
    resetC.addListener(() {
      validateReset();
    });
    emailC.addListener(() {
      validateEmail();
    });
    passC.addListener(() {
      validatePassword();
    });
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

  void validateAndLogin() {
    isEmailValid.value = emailC.text.isNotEmpty;
    isPassValid.value = passC.text.isNotEmpty && passC.text.length >= 8;

    if (!isEmailValid.value || !isPassValid.value) {
      customDialog(
        title: "Oops!",
        isSuccess: false,
        isLoginDialog: true,
      );
    } else {
      loginauth(
        emailC.text,
        passC.text,
      );
    }
  }

  void resetPassword(String email) async {
    showLoading();
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.back();
      Get.snackbar(
        'Password reset link sent!',
        'Please check your email for instructions to reset your password. Make sure to check your spam or junk folder if you don’t see it in your inbox.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: green,
        colorText: white,
        duration: const Duration(seconds: 6),
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(20),
        borderRadius: 10,
      );
    } on FirebaseAuthException catch (e) {
      Get.back();
      String errorMessage = getErrorMessage(e.code);
      Get.snackbar('Oops!', errorMessage);
    }
  }

  void loginauth(String email, String password) async {
    showLoading();
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.back();
      customDialog(
        title: "Login Successful",
        isSuccess: true,
        isLoginDialog: true,
      );
    } on FirebaseAuthException catch (e) {
      Get.back();
      String errorMessage = getErrorMessage(e.code);
      customDialog(
        title: "Oops",
        isSuccess: false,
        isLoginDialog: true,
        content: errorMessage,
      );
    }
  }

  void resetDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Column(
          children: [
            const SizedBox(height: 15),
            const Text(
              "Just enter your email below, and we'll send you a link to reset your password.",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                color: green,
                fontWeight: FontWeight.bold,
                fontFamily: 'myfont',
              ),
            ),
            const SizedBox(height: 15),
            Obx(() => TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: resetC,
                  cursorColor: grey,
                  style: const TextStyle(
                    color: grey,
                    fontSize: 16,
                    fontFamily: 'myfont',
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.red, width: 1.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.red, width: 1.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      color: grey,
                      fontFamily: 'myfont',
                      fontSize: 16,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 9.0, right: 9.0),
                      child: SvgPicture.asset(
                        'assets/icons/email.svg',
                        height: 24,
                        width: 24,
                        fit: BoxFit.contain,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    errorText: resetError.value,
                  ),
                  onChanged: (value) {
                    validateReset();
                  },
                )),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: green, fontFamily: 'myfont'),
            ),
          ),
          Obx(() => TextButton(
                onPressed: (isResetValid.value && resetC.text.isNotEmpty)
                    ? () async {
                        Get.back();
                        resetPassword(resetC.text);
                      }
                    : null,
                child: Text(
                  'Reset password',
                  style: TextStyle(
                      color: (isResetValid.value && resetC.text.isNotEmpty)
                          ? green
                          : grey,
                      fontFamily: 'myfont'),
                ),
              )),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
