import 'package:flavour_lab/app/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_content_controller.dart';

class HomeContentView extends GetView<HomeContentController> {
  const HomeContentView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Text(
          'HomeContentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
