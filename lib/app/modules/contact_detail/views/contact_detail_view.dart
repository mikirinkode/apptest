import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/theme/app_color.dart';
import '../controllers/contact_detail_controller.dart';

class ContactDetailView extends GetView<ContactDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Save",
                style: TextStyle(color: AppColor.primary),
              ))
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                  title: "First Name", initialValue: "", onSaved: (value) {}),
              ContactInputField(
                  title: "Last Name", initialValue: "", onSaved: (value) {}),
            ]),
            ContactDetailSection(title: "Sub Information", body: [
              ContactInputField(
                  title: "Email", initialValue: "", onSaved: (value) {}),
              ContactDateInput(
                  title: "DOB", initialValue: "", onSaved: (value) {})
            ]),
          ],
        ),
      ),
    );
  }
}

class ContactDetailSection extends StatelessWidget {
  final String title;
  final List<Widget> body;

  const ContactDetailSection(
      {required this.title, required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(color: AppColor.neutral100),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Column(
          children: body,
        )
      ],
    );
  }
}

class ContactInputField extends StatelessWidget {
  final String title;
  final String initialValue;
  final Function(String?) onSaved;

  const ContactInputField(
      {required this.title,
      required this.initialValue,
      required this.onSaved,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text(title,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                ),
                const SizedBox(
                  width: 16,
                ),
                Flexible(
                  flex: 3,
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                      initialValue: initialValue,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name cannot be blank";
                        }
                        return null;
                      },
                      onSaved: onSaved),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: AppColor.neutral200,
          )
        ],
      ),
    );
  }
}

class ContactDateInput extends StatelessWidget {
  final String title;
  final String initialValue;
  final Function(String?) onSaved;

  const ContactDateInput(
      {required this.title,
      required this.initialValue,
      required this.onSaved,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text(title,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                ),
                const SizedBox(
                  width: 16,
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.neutral200)),
                    child: Row(
                      children: [
                        Expanded(child: Text(initialValue)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.date_range))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: AppColor.neutral200,
          )
        ],
      ),
    );
  }
}
