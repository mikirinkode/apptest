import 'package:apptest/app/data/contact_model.dart';
import 'package:apptest/app/routes/app_pages.dart';
import 'package:apptest/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/contact_card.dart';

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
      body: RefreshIndicator(
        onRefresh: () async {
          controller.loadData();
        },
        child: Obx(
          () => GridView(
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
                      ContactModel result = await Get.toNamed(Routes.CONTACT_DETAIL,
                          arguments: {"CONTACT_MODEL": contact});
                      controller.updateData(result, 0);
                    }))
                .toList(),
          ),
        ),
      ),
    );
  }
}