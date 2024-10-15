import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  var isEmailValid = true.obs;
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
}
