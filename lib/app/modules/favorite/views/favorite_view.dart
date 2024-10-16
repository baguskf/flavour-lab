import 'package:flavour_lab/app/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Text(
          'FavoriteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
