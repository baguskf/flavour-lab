import 'package:flavour_lab/app/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/personal_info_controller.dart';

class PersonalInfoView extends GetView<PersonalInfoController> {
  const PersonalInfoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          children: [
            const SizedBox(
              height: 77,
            ),
            const Text(
              "Let's Update Your Personal Information",
              style: TextStyle(
                fontFamily: 'myfont',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            TextField(
              // controller: controller.nameC,
              cursorColor: grey,
              maxLength: 20,
              buildCounter: (BuildContext context,
                  {int? currentLength,
                  required int? maxLength,
                  required bool isFocused}) {
                return null;
              },
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
                    )),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Name',
                hintStyle: const TextStyle(
                  color: grey,
                  fontFamily: 'myfont',
                  fontSize: 16,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 9.0, right: 9.0),
                  child: SvgPicture.asset(
                    'assets/icons/person.svg',
                    height: 24,
                    width: 24,
                    fit: BoxFit.contain,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                // errorText: controller.nameError.value,
              ),
              onChanged: (value) {
                // controller.validateName();
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              // controller: controller.nameC,
              cursorColor: grey,
              maxLength: 20,
              buildCounter: (BuildContext context,
                  {int? currentLength,
                  required int? maxLength,
                  required bool isFocused}) {
                return null;
              },
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
                    )),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Phone',
                hintStyle: const TextStyle(
                  color: grey,
                  fontFamily: 'myfont',
                  fontSize: 16,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 9.0, right: 9.0),
                  child: SvgPicture.asset(
                    'assets/icons/phone.svg',
                    height: 24,
                    width: 24,
                    fit: BoxFit.contain,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                // errorText: controller.nameError.value,
              ),
              onChanged: (value) {
                // controller.validateName();
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              // controller: controller.nameC,
              cursorColor: grey,
              maxLength: 20,
              buildCounter: (BuildContext context,
                  {int? currentLength,
                  required int? maxLength,
                  required bool isFocused}) {
                return null;
              },
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
                    )),
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
                // errorText: controller.nameError.value,
              ),
              onChanged: (value) {
                // controller.validateName();
              },
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: green, width: 2),
                    ),
                    minimumSize: const Size(82, 43),
                    backgroundColor: primary,
                  ),
                  onPressed: () => Get.back(),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        fontFamily: 'myfont',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: green),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: const Size(82, 43),
                    backgroundColor: green,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Save',
                    style: TextStyle(
                        fontFamily: 'myfont',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(
      //       left: 40.0, right: 0), // Jarak antara tombol dan tepi layar
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       ElevatedButton(
      //         style: ElevatedButton.styleFrom(
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(15),
      //             side: const BorderSide(color: green, width: 2),
      //           ),
      //           minimumSize: const Size(82, 43),
      //           backgroundColor: primary,
      //         ),
      //         onPressed: () => Get.back(),
      //         child: const Text(
      //           'Cancel',
      //           style: TextStyle(
      //             fontFamily: 'myfont',
      //             fontSize: 16,
      //             fontWeight: FontWeight.bold,
      //             color: green,
      //           ),
      //         ),
      //       ),
      //       // Jarak antar tombol
      //       ElevatedButton(
      //         style: ElevatedButton.styleFrom(
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(15),
      //           ),
      //           minimumSize: const Size(82, 43),
      //           backgroundColor: green,
      //         ),
      //         onPressed: () {
      //           // Action for save
      //         },
      //         child: const Text(
      //           'Save',
      //           style: TextStyle(
      //             fontFamily: 'myfont',
      //             fontSize: 16,
      //             fontWeight: FontWeight.bold,
      //             color: Colors.white,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
