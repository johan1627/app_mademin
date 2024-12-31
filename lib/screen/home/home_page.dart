import 'package:app_mademin/components/atoms/gen_function.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/screen/auth/welcome_home/comp_wappbar.dart';
import 'package:app_mademin/screen/home/components/comp_sec_bg_white.dart';
import 'package:app_mademin/screen/home/components/comp_sec_card_top.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // import
  GeneralFunction function = GeneralFunction();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: WillPopScope(
        onWillPop: () {
          return function.onWillPop(context);
        },
        child: Stack(
          children: [
            // Background
            Container(
              decoration: const BoxDecoration(
                color: primaryColor,
              ),
            ),
            // Background White
            const CompSectionBgWhite(),
            Column(
              children: const [
                CompWelAppBar(),
                CompSectionCardTop(),
              ],
            )
          ],
        ),
      )),
    );
  }
}
