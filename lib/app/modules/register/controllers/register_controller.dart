import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flavour_lab/app/routes/app_pages.dart';
import 'package:flavour_lab/app/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        title: "Oops!",
        email: null,
        isSuccess: false,
        content: null,
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
    showLoading();

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.sendEmailVerification();

      Get.back();
      customDialog(
        title: "Verify your email!",
        email: userCredential.user!.email,
        isSuccess: true,
        content: null,
      );

      if (auth.currentUser != null) {
        checkEmailVerified(userCredential.user!, name);
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      String errorMessage = getErrorMessage(e.code);
      customDialog(
        title: "Oops!",
        email: null,
        isSuccess: false,
        content: errorMessage,
      );
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
    showLoading();
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
}
