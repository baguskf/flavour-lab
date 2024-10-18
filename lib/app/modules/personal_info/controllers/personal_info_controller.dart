import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_lab/app/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PersonalInfoController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore data = FirebaseFirestore.instance;

  var isNameValid = true.obs;
  var isPhoneValid = true.obs;

  var nameError = RxnString();
  var phoneError = RxnString();

  TextEditingController nameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController dateC = TextEditingController();

  void validateName() {
    String name = nameC.text;
    if (name.isEmpty) {
      nameError.value = 'Name cannot be empty!';
      isPhoneValid.value = false;
    } else if (name.length < 2 || name.length > 30) {
      nameError.value = 'Name must be between 2 and 30 characters!';
      isPhoneValid.value = false;
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)) {
      nameError.value = 'Name can only contain letters and spaces!';
      isPhoneValid.value = false;
    } else {
      nameError.value = null;
      isPhoneValid.value = true;
    }
  }

  void validatephone() {
    String name = phoneC.text;
    if (name.length < 10 || name.length > 14) {
      phoneError.value = 'Phone must be between 2 and 13 numbers!';
      isNameValid.value = false;
    } else {
      phoneError.value = null;
      isNameValid.value = true;
    }
  }

  @override
  void onInit() {
    super.onInit();
    curentData();
  }

  void curentData() async {
    String uid = auth.currentUser!.uid;
    DocumentReference users = data.collection('users').doc(uid);

    try {
      DocumentSnapshot snapshot = await users.get();

      if (snapshot.exists) {
        Map<String, dynamic>? userData =
            snapshot.data() as Map<String, dynamic>?;

        nameC.text = userData?['name'] ?? 'No name available';
        phoneC.text = userData?['phone'] ?? 'No phone available';
        dateC.text = userData?['date'] ?? 'No date available';
      } else {
        nameC.text = 'User not found';
        phoneC.text = 'No phone available';
        dateC.text = 'No date available';
      }
    } catch (e) {
      nameC.text = 'Error: ${e.toString()}';
    }
  }

  void updateData(String name, String phone, String date) async {
    showLoading();
    try {
      await data.collection('users').doc(auth.currentUser!.uid).update({
        'name': name,
        'phone': phone,
        'date': date,
      });
      print('Data updated successfully!');
      Get.back();
    } catch (e) {
      print('Error updating data: $e');
    }
  }

  void updateDate(DateTime newDate) {
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    dateC.text = formatter.format(newDate);
  }
}
