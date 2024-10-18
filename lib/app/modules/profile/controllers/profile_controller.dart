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
    emailC.text = auth.currentUser?.email ?? '';
    dateC.text = currentUserDate.value;
    super.onInit();
  }

  Stream<DocumentSnapshot<Object?>> streamData() {
    String uid = auth.currentUser!.uid;
    DocumentReference users = data.collection('users').doc(uid);
    return users.snapshots();
  }

  loading() {
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
