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
    final jsonResult = jsonDecode(data);
    final List<ContactModel> resultList = jsonResult
        .map<ContactModel>((item) => ContactModel.fromJson(item))
        .toList();
    contactList.clear();
    contactList.assignAll(resultList);
    Get.log("contact list length: ${resultList.length}");
  }

  void updateData(ContactModel? result, int index) {
    Get.log("Data from detail received: ${result?.firstName}, ${result?.lastName}, ${result?.email}, ${result?.dob}");
    final oldData = contactList.firstWhere((element) => element.id == result?.id);
    if (oldData != null && result != null){
      var index = contactList.indexOf(oldData);
      contactList[index] = result;
    }
  }
}
