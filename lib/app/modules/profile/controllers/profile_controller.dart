import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_lab/app/colors/colors.dart';
import 'package:flavour_lab/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ProfileController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore data = FirebaseFirestore.instance;

  final TextEditingController emailC = TextEditingController();
  final TextEditingController dateC = TextEditingController();

  var isDarkMode = false.obs;

  var currentUserName = ''.obs;
  var currentUserEmail = ''.obs;
  var currentUserDate = ''.obs;
  var currentUserPhone = ''.obs;

  @override
  void onInit() {
    getCurrentUserData();
    emailC.text = auth.currentUser?.email ?? '';
    dateC.text = currentUserDate.value;
    super.onInit();
  }

  void getCurrentUserData() async {
    try {
      String uid = auth.currentUser!.uid;

      DocumentSnapshot userDoc = await data.collection('users').doc(uid).get();

      if (userDoc.exists) {
        currentUserName.value = userDoc['name'];
        currentUserEmail.value = userDoc['email'];
        currentUserDate.value = userDoc['date'];
        currentUserPhone.value = userDoc['phone'];
      } else {
        currentUserName.value = "Name not found";
        currentUserEmail.value = "Email not found";
        currentUserDate.value = "Date not found";
        currentUserPhone.value = "Phone not found";
      }
    } catch (e) {
      currentUserName.value = "Error $e";
      currentUserEmail.value = "Error $e";
      currentUserDate.value = "Error $e";
      currentUserPhone.value = "Error $e";
    }
  }

  void customDialog() {
    if (Get.isDialogOpen!) {
      Get.back();
    }

    Get.dialog(
      AlertDialog(
        backgroundColor: primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              textAlign: TextAlign.left,
              "Need to update anything?",
              style: TextStyle(
                fontSize: 20,
                color: green,
                fontWeight: FontWeight.bold,
                fontFamily: 'myfont',
              ),
            ),
            const Text(
              'Use the fields below to change your info.',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'myfont',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: emailC,
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
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
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
                // errorText: controller.emailError.value,
              ),
              onChanged: (value) {
                // controller.validateEmail();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: dateC,
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
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Date of birth',
                hintStyle: const TextStyle(
                  color: grey,
                  fontFamily: 'myfont',
                  fontSize: 16,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 9.0, right: 9.0),
                  child: SvgPicture.asset(
                    'assets/icons/ibirthday.svg',
                    height: 24,
                    width: 24,
                    fit: BoxFit.contain,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                // errorText: controller.emailError.value,
              ),
              onChanged: (value) {
                // controller.validateEmail();
              },
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              Get.back();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: green, fontFamily: 'myfont'),
            ),
          ),
          TextButton(
            onPressed: () async {
              // if (auth.currentUser != null) {
              //   loading();
              //   await auth.currentUser!.delete();
              //   Get.back();
              // }
              Get.back();
            },
            child: const Text(
              'Save',
              style: TextStyle(color: green, fontFamily: 'myfont'),
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

  void toggleDarkMode(bool isDark) {
    isDarkMode.value = isDark;

    if (isDark) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
  }

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
