// ignore_for_file: deprecated_member_use, unrelated_type_equality_checks

import 'package:flavour_lab/app/colors/colors.dart';
import 'package:flavour_lab/app/modules/favorite/views/favorite_view.dart';
import 'package:flavour_lab/app/modules/home_content/views/home_content_view.dart';
import 'package:flavour_lab/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final List<String> icons = [
    'assets/icons/home.svg',
    'assets/icons/favorite.svg',
    'assets/icons/profile.svg',
  ];

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      const HomeContentView(),
      const FavoriteView(),
      const ProfileView(),
    ];

    return Scaffold(
      body: Stack(
        children: [
          Obx(() => widgets[controller.currentIndex.value]),
          Align(
            alignment: const Alignment(0.0, 1.0),
            child: Container(
              height: 63,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x40000000),
                    blurRadius: 8.0,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                child: Obx(
                  () => BottomNavigationBar(
                    backgroundColor: Colors.white,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: controller.currentIndex.value,
                    selectedItemColor: green,
                    unselectedLabelStyle: const TextStyle(
                        fontFamily: 'myfont',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    selectedFontSize: 12,
                    selectedLabelStyle: const TextStyle(
                      fontFamily: 'myfont',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: (int i) {
                      controller.currentIndex.value = i;
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          icons[0],
                          color: controller.currentIndex == 0
                              ? green
                              : Colors.black,
                          width: 24,
                          height: 24,
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          icons[1],
                          color: controller.currentIndex == 1
                              ? green
                              : Colors.black,
                          width: 24,
                          height: 24,
                        ),
                        label: 'Search',
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(icons[2],
                            color: controller.currentIndex == 2
                                ? green
                                : Colors.black,
                            width: 24,
                            height: 24),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
