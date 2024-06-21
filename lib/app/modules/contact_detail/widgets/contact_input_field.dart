
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';

class ContactInputField extends StatelessWidget {
  final String title;
  final String initialValue;
  final bool isRequired;
  final Function(String?) onChanged;

  const ContactInputField(
      {required this.title,
        required this.initialValue,
        required this.isRequired,
        required this.onChanged,
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
                        if ((value == null || value.isEmpty) && isRequired) {
                          return "field cannot be blank";
                        }
                        return null;
                      },
                      onChanged: onChanged),
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