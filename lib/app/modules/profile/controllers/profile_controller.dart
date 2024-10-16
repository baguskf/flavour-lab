import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_lab/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
