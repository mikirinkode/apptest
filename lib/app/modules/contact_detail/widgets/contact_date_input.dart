
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';

class ContactDateInput extends StatelessWidget {
  final String title;
  final String initialValue;
  final Function() onShowDatePicker;

  const ContactDateInput(
      {required this.title,
        required this.initialValue,
        required this.onShowDatePicker,
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
                            onPressed: onShowDatePicker, icon: Icon(Icons.date_range))
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