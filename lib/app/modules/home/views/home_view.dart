import 'package:apptest/app/routes/app_pages.dart';
import 'package:apptest/core/theme/app_color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: AppColor.primary,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: AppColor.primary,
              ))
        ],
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1),
        children: controller.contactList
            .map((contact) => ContactCard(
                name: "${contact.firstName} ${contact.lastName}",
                onTap: () async {
                  var result = await Get.toNamed(Routes.CONTACT_DETAIL,
                      arguments: {"CONTACT_MODEL", contact});
                }))
            .toList(),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final Function() onTap;

  const ContactCard({required this.name, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColor.neutral200)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: const BoxDecoration(
                    color: AppColor.primary, shape: BoxShape.circle),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
