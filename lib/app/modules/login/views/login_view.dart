import 'package:flavour_lab/app/colors/colors.dart';
import 'package:flavour_lab/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Image.asset(
                  'assets/images/login.png',
                  height: 261,
                  width: 261,
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              const Text(
                'Login to start your culinary journey with FlavorLab',
                style: TextStyle(
                  fontFamily: 'mybold',
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 45,
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
              Obx(() => TextField(
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
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                      errorText: controller.passwordError.value,
                    ),
                    onChanged: (value) {
                      controller.validatePassword();
                    },
                  )),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontFamily: 'myfont',
                      fontSize: 16,
                      color: green,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  minimumSize: const Size(double.infinity, 43),
                  backgroundColor: green,
                ),
                onPressed: () => controller.validateAndLogin(),
                child: const Text(
                  'Sign In',
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
                      text: 'New here? ',
                      style: TextStyle(
                        color: grey,
                        fontFamily: 'myfont',
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: 'Sign up',
                      style: const TextStyle(
                        color: green,
                        fontFamily: 'myfont',
                        fontSize: 16,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(Routes.REGISTER);
                        },
                    ),
                    const TextSpan(
                      text: ' now and explore endless delicious recipes!',
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
