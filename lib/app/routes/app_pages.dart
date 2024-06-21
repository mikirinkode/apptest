import 'package:get/get.dart';

import 'package:apptest/app/modules/contact_detail/bindings/contact_detail_binding.dart';
import 'package:apptest/app/modules/contact_detail/views/contact_detail_view.dart';
import 'package:apptest/app/modules/home/bindings/home_binding.dart';
import 'package:apptest/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_DETAIL,
      page: () => ContactDetailView(),
      binding: ContactDetailBinding(),
    ),
  ];
}
