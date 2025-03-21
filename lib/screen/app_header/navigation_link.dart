import 'package:flutter/material.dart';
import 'package:ninja/constants/app_colors.dart';

class NavigationLink extends StatelessWidget {
  const NavigationLink({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextButton(
          child: Text(text,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: AppColors.black)),
          onPressed: () {},
        ),
      ),
    );
  }
}
