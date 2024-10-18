import 'package:flavour_lab/app/colors/colors.dart';
import 'package:flavour_lab/app/widget/widget.dart';
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
            Obx(
              () => TextField(
                controller: controller.nameC,
                keyboardType: TextInputType.name,
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
                  errorText: controller.nameError.value,
                ),
                onChanged: (value) {
                  controller.validateName();
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(() => TextField(
                  controller: controller.phoneC,
                  keyboardType: TextInputType.phone,
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
                      borderSide:
                          const BorderSide(color: Colors.red, width: 1.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.red, width: 1.5),
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
                    errorText: controller.phoneError.value,
                  ),
                  onChanged: (value) {
                    controller.validatephone();
                  },
                )),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: controller.dateC,
              keyboardType: TextInputType.datetime,
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
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(left: 9.0, right: 9.0),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/calendar.svg',
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain,
                    ),
                    onPressed: () => datepicker(context),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
              ),
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
                  onPressed: () {
                    controller.updateData(
                      controller.nameC.text,
                      controller.phoneC.text,
                      controller.dateC.text,
                    );
                    FocusScope.of(context).unfocus();
                    Get.delete<PersonalInfoController>();
                    Get.back();
                  },
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
    );
  }
}
