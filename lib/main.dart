import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ninja/constants/app_text_theme.dart';
import 'package:ninja/constants/breakpoints.dart';
import 'package:ninja/screen/landing/landing_screen.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle("My Desktop App");
    setWindowMinSize(Size(375, 750));
    setWindowMaxSize(Size(1000, 1000));
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // TODO: Save this as breakpoint
      final isDesktop = constraints.maxWidth > Breakpoints.tablet;
      final textTheme = isDesktop ? DesktopTextTheme() : MobileTextTheme();
      return MaterialApp(
        title: 'Code With Andrea',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            displayLarge: textTheme.h1,
            displayMedium: textTheme.h2,
            displaySmall: textTheme.h3,
            headlineMedium: textTheme.h4,
            headlineSmall: textTheme.h5,
            titleLarge: textTheme.h6,
            titleMedium: textTheme.subtitle1,
            titleSmall: textTheme.subtitle2,
            bodyLarge: textTheme.body,
            labelLarge: textTheme.button,
          ),
          //cardColor: AppColors.neutral6,
          // TODO: Make it work!
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        home: const LandingScreen(),
      );
    });
  }
}
