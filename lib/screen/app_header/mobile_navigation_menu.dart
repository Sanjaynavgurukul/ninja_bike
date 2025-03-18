import 'package:flutter/material.dart';
import 'package:ninja/constants/app_colors.dart';

class MobileNavigationMenu extends StatelessWidget {
  const MobileNavigationMenu({super.key, this.expanded = false});
  final bool expanded;

  static const menuHeight = 56 * 2 + 64;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: expanded ? AppColors.appBArColor : Colors.transparent,
      child: ListView(
        shrinkWrap: true,
        children: [
          const MobileMenuListTile(
            title: 'Dashboard',
          ),
          const MobileMenuListTile(
            title: 'Feedback',
          ),
          const MobileMenuListTile(
            title: 'Setting',
          ),
        ],
      ),
    );
  }
}

class MobileMenuListTile extends StatelessWidget {
  const MobileMenuListTile({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 6),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.black),
        ),
      ),
    );
  }
}

class MobileToggleButton extends StatelessWidget {
  const MobileToggleButton({super.key, this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.neutral6,
        side: const BorderSide(color: AppColors.neutral2),
        shape: const StadiumBorder(),
      ),
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add),
            const SizedBox(width: 12),
            Text('Switch to light mode',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
