import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/theme/app_color.dart';
import '../controllers/contact_detail_controller.dart';
import '../widgets/contact_date_input.dart';
import '../widgets/contact_detail_section.dart';
import '../widgets/contact_input_field.dart';

class ContactDetailView extends GetView<ContactDetailController> {
  @override
  Widget build(BuildContext context) {
    controller.contactFormKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                controller.saveData();
              },
              child: Text(
                "Save",
                style: TextStyle(color: AppColor.primary),
              ))
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Form(
            key: controller.contactFormKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    width: 86,
                    height: 86,
                    decoration: const BoxDecoration(
                        color: AppColor.primary, shape: BoxShape.circle),
                  ),
                ),
                ContactDetailSection(title: "Main Information", body: [
                  ContactInputField(
                      title: "First Name",
                      initialValue: controller.firstNameInput,
                      isRequired: true,
                      onChanged: (value) {
                        controller.onFirstNameChanged(value ?? "");
                      }),
                  ContactInputField(
                      title: "Last Name",
                      initialValue: controller.lastNameInput,
                      isRequired: true,
                      onChanged: (value) {
                        controller.onLastNameChanged(value ?? "");
                      }),
                ]),
                ContactDetailSection(title: "Sub Information", body: [
                  ContactInputField(
                      title: "Email",
                      initialValue: controller.emailInput,
                      isRequired: false,
                      onChanged: (value) {
                        controller.onEmailNameChanged(value ?? "");
                      }),
                  ContactDateInput(
                      title: "DOB",
                      initialValue: controller.dobInput,
                      onShowDatePicker: () async {
                        await controller.showDatePickerAppliedDate(context);
                      })
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
