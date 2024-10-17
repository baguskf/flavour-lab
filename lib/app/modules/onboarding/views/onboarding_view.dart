import 'package:flavour_lab/app/colors/colors.dart';
import 'package:flavour_lab/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 116),
                child: Text(
                  'FavorLab',
                  style: TextStyle(
                    fontFamily: 'myfont',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
              ),
              const Text(
                'Discover, cook, and enjoy delicious recipes crafted just for you!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'myfont',
                  fontSize: 16,
                  color: white,
                ),
              ),
              const SizedBox(
                height: 524,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  minimumSize: const Size(double.infinity, 52),
                  backgroundColor: green,
                ),
                onPressed: () => Get.offAllNamed(Routes.LOGIN),
                child: const Text(
                  "Let's go",
                  style: TextStyle(
                    fontFamily: 'myfont',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
              ),
              const SizedBox(
                height: 47,
              ),
              const Text(
                'FlavorLab 1.0 by baguskaruniaf',
                style: TextStyle(
                  fontFamily: 'myfont',
                  fontSize: 13,
                  color: grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
