import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';

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
