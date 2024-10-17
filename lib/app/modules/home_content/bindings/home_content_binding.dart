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
