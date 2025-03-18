import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ninja/constants/app_colors.dart';
import 'package:ninja/constants/breakpoints.dart';
import 'package:ninja/screen/app_header/mobile_navigation_menu.dart';
import 'package:ninja/screen/app_header/navigation_icon_button.dart';
import 'package:ninja/screen/app_header/navigation_link.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isWide = screenWidth > Breakpoints.tablet;
    return Container(
      child: isWide
          ? const DesktopNavigationLayout()
          : const MobileNavigationLayout(),
    );
  }
}

class DesktopNavigationLayout extends StatelessWidget {
  const DesktopNavigationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isVeryWide = screenWidth > Breakpoints.desktop;

    return SliverAppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.appBArColor,
      pinned: false,
      floating: true,
      snap: true,
      flexibleSpace: SizedBox(
        height: 64,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 60,
            ),
            const Spacer(),
            const NavigationLink(text: 'Dashboard'),
            const NavigationLink(text: 'FeedBack'),
            const NavigationLink(text: 'Setting'),
            SizedBox(width: isVeryWide ? 80 : 28),
          ],
        ),
      ),
    );
  }
}

class MobileNavigationLayout extends StatefulWidget {
  const MobileNavigationLayout({super.key});

  @override
  State<MobileNavigationLayout> createState() => _MobileNavigationLayoutState();
}

class _MobileNavigationLayoutState extends State<MobileNavigationLayout>
    with SingleTickerProviderStateMixin {
  late final _menuController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 150));

  void _toggleMenu() {
    if (_menuController.isCompleted) {
      _menuController.reverse();
    } else {
      _menuController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    double originHeight = 64;
    return AnimatedBuilder(
        animation: _menuController,
        builder: (context, _) {
          final height = originHeight +
              _menuController.value * MobileNavigationMenu.menuHeight;
          return SliverAppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.appBArColor,
            pinned: false,
            expandedHeight: height,
            floating: true,
            snap: true,
            flexibleSpace: SizedBox(
              height: height,
              child: ListView(
                children: [
                  SizedBox(
                    height: 64,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          height: 60,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: _toggleMenu,
                          child: AnimatedIcon(
                            icon: AnimatedIcons.menu_close,
                            progress: _menuController,
                            color: AppColors.neutral2,
                          ),
                        ),
                        const SizedBox(width: 28),
                      ],
                    ),
                  ),
                  Expanded(
                      child: MobileNavigationMenu(
                    expanded: _menuController.isCompleted,
                  )),
                ],
              ),
            ),
          );
        });
  }
}
