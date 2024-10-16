import 'package:flavour_lab/app/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 52.0),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontFamily: 'myfont',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    const SizedBox(
                      height: 124,
                      width: 124,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/haerin.png'),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SvgPicture.asset(
                        'assets/icons/edit.svg',
                        height: 34,
                        width: 34,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Kang Haerin',
                  style: TextStyle(
                    fontFamily: 'myfont',
                    fontSize: 16,
                    color: grey,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
