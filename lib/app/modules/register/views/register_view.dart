import 'package:flavour_lab/app/colors/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 197.0),
                child: Text(
                  'Join FlavorLab and unlock a world of delicious recipes!',
                  style: TextStyle(
                    fontFamily: 'myfont',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Obx(
                () => TextField(
                  controller: controller.nameC,
                  cursorColor: grey,
                  maxLength: 20,
                  buildCounter: (BuildContext context,
                      {int? currentLength,
                      required int? maxLength,
                      required bool isFocused}) {
                    return null;
                  },
                  style: const TextStyle(
                    color: grey,
                    fontSize: 16,
                    fontFamily: 'myfont',
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        )),
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
                    hintText: 'Name',
                    hintStyle: const TextStyle(
                      color: grey,
                      fontFamily: 'myfont',
                      fontSize: 16,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 9.0, right: 9.0),
                      child: Image.asset(
                        'assets/icons/person.png',
                        height: 24,
                        width: 24,
                        fit: BoxFit.contain,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    errorText: controller.nameError.value,
                  ),
                  onChanged: (value) {
                    controller.validateName();
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(() => TextField(
                    controller: controller.emailC,
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
                        borderSide: BorderSide(color: white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: white),
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
                        child: Image.asset(
                          'assets/icons/mage_email.png',
                          height: 24,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                      errorText: controller.emailError.value,
                    ),
                    onChanged: (value) {
                      controller.validateEmail();
                    },
                  )),
              const SizedBox(
                height: 15,
              ),
              Obx(
                () => TextField(
                  obscureText: controller.isObscure.value,
                  controller: controller.passC,
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
                      borderSide: BorderSide(color: white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: white),
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
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      color: grey,
                      fontFamily: 'myfont',
                      fontSize: 16,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 9.0, right: 9.0),
                      child: Image.asset(
                        'assets/icons/password.png',
                        height: 24,
                        width: 24,
                        fit: BoxFit.contain,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isObscure.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: grey,
                      ),
                      onPressed: () => controller.toggleObscure(),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    errorText: controller.passwordError.value,
                  ),
                  onChanged: (value) {
                    controller.validatePassword();
                  },
                ),
              ),
              const SizedBox(height: 15),
              Obx(
                () => TextField(
                  obscureText: controller.isConfirmObscure.value,
                  controller: controller.confirmpassC,
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
                      borderSide: BorderSide(color: white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: white),
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
                    hintText: 'Confirm Password',
                    hintStyle: const TextStyle(
                      color: grey,
                      fontFamily: 'myfont',
                      fontSize: 16,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 9.0, right: 9.0),
                      child: Image.asset(
                        'assets/icons/password.png',
                        height: 24,
                        width: 24,
                        fit: BoxFit.contain,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isConfirmObscure.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: grey,
                      ),
                      onPressed: () => controller.confirmToggleObscure(),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    errorText: controller.passwordConfirmError.value,
                  ),
                  onChanged: (value) {
                    controller.validatePasswordConfirmation();
                  },
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  minimumSize: const Size(double.infinity, 43),
                  backgroundColor: green,
                ),
                onPressed: () {
                  controller.validateAndRegister();
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontFamily: 'myfont',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                        color: grey,
                        fontFamily: 'myfont',
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: 'Log in',
                      style: const TextStyle(
                        color: green,
                        fontFamily: 'myfont',
                        fontSize: 16,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.back();
                        },
                    ),
                    const TextSpan(
                      text: ' here',
                      style: TextStyle(
                        color: grey,
                        fontFamily: 'myfont',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
