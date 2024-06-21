import 'package:apptest/app/data/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ContactDetailController extends GetxController {
  late GlobalKey<FormState> contactFormKey;

  final Rxn<ContactModel> _contact = Rxn<ContactModel>();

  final _firstNameInput = "".obs;
  final _lastNameInput = "".obs;
  final _emailInput = "".obs;
  final _dobInput = "".obs;

  final dobInputController = TextEditingController();

  String get firstNameInput => _firstNameInput.value;

  String get lastNameInput => _lastNameInput.value;

  String get emailInput => _emailInput.value;

  String get dobInput => _dobInput.value;

  @override
  void onInit() {
    super.onInit();
    _loadArguments();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void _loadArguments() {
    _contact(Get.arguments["CONTACT_MODEL"]);
    Get.log("Contact name: ${_contact.value?.firstName}");
    _firstNameInput.value = _contact.value?.firstName ?? "";
    _lastNameInput.value = _contact.value?.lastName ?? "";
    _emailInput.value = _contact.value?.email ?? "";
    _dobInput.value = _contact.value?.dob ?? "";
  }

  showDatePickerAppliedDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          2000),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat("dd/MM/yyyy").format(pickedDate);
      // dobInputController.text = formattedDate;
      _dobInput.value = formattedDate;
    }
  }

  void onFirstNameChanged(String value) {
    _firstNameInput.value = value;
  }

  void onLastNameChanged(String value) {
    _lastNameInput.value = value;
  }

  void onEmailNameChanged(String value) {
    _emailInput.value = value;
  }

  Future<void> saveData() async {
    Get.focusScope?.unfocus();
    Get.log(
        "contactFormKey.currentState?.validate() ?? false ---> ${contactFormKey.currentState?.validate() ?? false}");
    if (contactFormKey.currentState?.validate() ?? false) {
      contactFormKey.currentState?.save();

      Get.log("first name: $firstNameInput");
      Get.log("last name: $lastNameInput");
      Get.log("email: $emailInput");
      Get.log("dob: $dobInput");
      if (_contact.value?.id != null) {
        var newData = ContactModel(
            id: _contact.value!.id,
            firstName: firstNameInput,
            lastName: lastNameInput,
            email: emailInput,
            dob: dobInput);

        Get.back(result: newData);
      }
    }
  }
}
