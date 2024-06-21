import 'package:flutter/cupertino.dart';

import '../../../../core/theme/app_color.dart';

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
