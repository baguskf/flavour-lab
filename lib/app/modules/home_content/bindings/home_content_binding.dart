import 'package:flavour_lab/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_content_controller.dart';

class HomeContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeContentController>(
      () => HomeContentController(),
    );
  }
}
