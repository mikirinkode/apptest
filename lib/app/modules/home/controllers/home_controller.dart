import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/contact_model.dart';

class HomeController extends GetxController {
  final contactList = <ContactModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> loadData() async {
    String data = await rootBundle.loadString("assets/data.json");
    // Get.log("data: ${data}");
    final jsonResult = jsonDecode(data);
    // Get.log("json result: ${jsonResult}");
    final List<ContactModel> resultList = jsonResult
        .map<ContactModel>((item) => ContactModel.fromJson(item))
        .toList();
    contactList.assignAll(resultList);
    Get.log("contact list length: ${resultList.length}");
  }
}
