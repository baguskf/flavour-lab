import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_lab/app/routes/app_pages.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
