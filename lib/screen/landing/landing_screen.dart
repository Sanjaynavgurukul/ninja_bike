import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ninja/constants/app_colors.dart';
import 'package:ninja/constants/breakpoints.dart';
import 'package:ninja/screen/app_header/app_header.dart';
import 'package:ninja/widget/gradient_text.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.backgroundColor,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            AppHeader(),
            SliverList(
              delegate: SliverChildListDelegate(
                [mainView()],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget mainView() {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > Breakpoints.tablet) {
      return Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: leftSection()),
            const SizedBox(
              width: 20,
            ),
            Expanded(flex: 3, child: rightSection()),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 12),
      child: Column(
        children: [
          leftSection(),
          const SizedBox(
            height: 20,
          ),
          rightSection()
        ],
      ),
    );
  }

  Widget leftSection() {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColors.backgroundColor2),
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(12),
                        child: Image.asset('assets/DSRX.png')),
                    Positioned(
                        top: 16,
                        left: 16,
                        child: Row(
                          children: [
                            Container(
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff33E542),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              'ARMED',
                              style: GoogleFonts.inter(
                                  color: Color(0xff33E542),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GradientText(
                              "2024 DSR/X",
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white,
                                    Colors.white.withOpacity(0.47)
                                  ]),
                              style: GoogleFonts.montserratAlternates(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("DUAL SPORT",
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: Color(0xffFFFFFF).withOpacity(0.6),
                                  fontWeight: FontWeight.w400,
                                ))
                          ],
                        ),
                      ),
                      Text("VIN : 219479120142",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Color(0xffFFFFFF).withOpacity(0.6),
                            fontWeight: FontWeight.w400,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                  child: leftSectionBottomCard(
                      label1: '12V', label2: 'BATTERY VOLTAGE')),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                  child: leftSectionBottomCard(
                      label1: '56%',
                      label2: 'STAGE OF CHARGE',
                      leftIcon: BootstrapIcons.lightning_charge_fill,
                      iconColor: Colors.green))
            ],
          )
        ],
      ),
    );
  }

  Widget leftSectionBottomCard(
      {required String label1,
      required String label2,
      IconData? leftIcon,
      Color? iconColor}) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Color(0xffB5C1CF)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (leftIcon != null)
                Icon(
                  leftIcon,
                  color: iconColor,
                ),
              Text(
                '$label1',
                style: GoogleFonts.inter(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          ),
          Text(
            '$label2',
            style: GoogleFonts.inter(
                color: Color(0xff3C4450),
                fontWeight: FontWeight.normal,
                fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget rightSection() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  colors: [Color(0xffF0F6FD), Color(0xffCCDAEB)]),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("FAULTS",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        '1',
                        style: GoogleFonts.inter(
                            color: Colors.white, fontSize: 12),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Icon(
                  BootstrapIcons.exclamation_triangle,
                  size: 50,
                  color: Colors.red,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      height: 24,
                      width: 24,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        '01',
                        style: GoogleFonts.inter(
                            color: Colors.white, fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("High Throttle",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            )),
                        Text(
                            "Likely throttle connection or\npotentiometer issue",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    )),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: Text("Troubleshoot",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            )))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Divider(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(boxShadow: [
                  new BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                  ),
                ], borderRadius: BorderRadius.circular(100), color: Colors.red),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Start Repair",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        )),
                    const SizedBox(
                      width: 12,
                    ),
                    Icon(
                      BootstrapIcons.fast_forward,
                      color: Colors.white,
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
