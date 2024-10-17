import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flavour_lab/app/colors/colors.dart';
import 'package:flavour_lab/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class RegisterController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore data = FirebaseFirestore.instance;

  final TextEditingController nameC = TextEditingController();
  final TextEditingController usernameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  final TextEditingController confirmpassC = TextEditingController();

  var isNameValid = true.obs;
  var isEmailValid = true.obs;
  var isPassValid = true.obs;
  var isCPassValid = true.obs;
  var isObscure = true.obs;
  var isConfirmObscure = true.obs;

  var nameError = RxnString();
  var emailError = RxnString();
  var passwordError = RxnString();
  var passwordConfirmError = RxnString();

  void validateName() {
    String name = nameC.text;
    if (name.isEmpty) {
      nameError.value = 'Name cannot be empty!';
      isNameValid.value = false;
    } else if (name.length < 2 || name.length > 30) {
      nameError.value = 'Name must be between 2 and 30 characters!';
      isNameValid.value = false;
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)) {
      nameError.value = 'Name can only contain letters and spaces!';
      isNameValid.value = false;
    } else {
      nameError.value = null;
      isNameValid.value = true;
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

  void validatePassword() {
    String pass = passC.text;
    if (pass.isEmpty) {
      passwordError.value = 'Password cannot be empty!';
      isPassValid.value = false;
    } else if (pass.length < 8) {
      passwordError.value = 'At least 8 characters!';
      isPassValid.value = false;
    } else {
      passwordError.value = null;
      isPassValid.value = true;
    }
  }

  void validatePasswordConfirmation() {
    String password = passC.text;
    String cpass = confirmpassC.text;
    if (cpass.isEmpty) {
      passwordConfirmError.value = 'Confirm Password cannot be empty!';
      isCPassValid.value = false;
    } else if (password != cpass) {
      passwordConfirmError.value = 'Passwords do not match!';
      isCPassValid.value = false;
    } else {
      passwordConfirmError.value = null;
      isCPassValid.value = true;
    }
  }

  RegisterController() {
    nameC.addListener(() {
      validateName();
    });
    emailC.addListener(() {
      validateEmail();
    });
    passC.addListener(() {
      validatePassword();
      validatePasswordConfirmation();
    });

    confirmpassC.addListener(() {
      validatePasswordConfirmation();
    });
  }

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  void confirmToggleObscure() {
    isConfirmObscure.value = !isConfirmObscure.value;
  }

  void validateAndRegister() {
    isNameValid.value = nameC.text.isNotEmpty;
    isEmailValid.value = emailC.text.isNotEmpty;
    isPassValid.value = passC.text.isNotEmpty && passC.text.length >= 8;
    isCPassValid.value = confirmpassC.text == passC.text;

    if (!isNameValid.value ||
        !isEmailValid.value ||
        !isPassValid.value ||
        !isCPassValid.value) {
      customDialog(
        null,
        false,
        null,
      );
    } else {
      registerAuth(
        emailC.text,
        passC.text,
        nameC.text,
      );
    }
  }

  void registerAuth(
    String email,
    String password,
    String name,
  ) async {
    loading();

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.sendEmailVerification();

      Get.back();
      customDialog(userCredential.user!.email, true, null);
      if (auth.currentUser != null) {
        checkEmailVerified(userCredential.user!, name);
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      String errorMessage = _getErrorMessage(e.code);
      customDialog(null, false, errorMessage);
    }
  }

  void checkEmailVerified(User user, String name) async {
    User? user = FirebaseAuth.instance.currentUser;
    while (user != null && !user.emailVerified) {
      await Future.delayed(const Duration(seconds: 3));
      await user.reload();
      user = FirebaseAuth.instance.currentUser;
    }

    Get.back();
    loading();
    if (user != null && user.emailVerified) {
      String uid = user.uid;
      await data.collection('users').doc(uid).set({
        'email': user.email,
        'name': name,
        'date': '-',
        'phone': '-',
        'createdAt': FieldValue.serverTimestamp(),
      });
      Get.back();
      await auth.signOut();
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  void customDialog(String? email, bool isSuccess, String? content) {
    if (Get.isDialogOpen!) {
      Get.back();
    }

    final String title = isSuccess ? "Verify your email!" : "Oops!";
    final String dialogContent = isSuccess
        ? 'Thanks for signing up with us! 🎉 To get started, we just need you to verify your email address $email'
        : content ??
            "Something went wrong. Please check your input and try again.";
    final String buttonContent = isSuccess ? 'Change email' : "Oke";
    final String iconPath =
        isSuccess ? 'assets/images/email.png' : 'assets/images/error.png';
    final Color myColor = isSuccess ? Colors.green : Colors.red;

    Get.dialog(
      AlertDialog(
        backgroundColor: primary,
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
              if (auth.currentUser != null) {
                loading();
                await auth.currentUser!.delete();
                Get.back();
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
