import 'package:app_mademin/components/atoms/gen_function.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/screen/auth/welcome_home/comp_wappbar.dart';
import 'package:flutter/material.dart';

class WelcomeHomePage extends StatefulWidget {
  const WelcomeHomePage({super.key});

  @override
  State<WelcomeHomePage> createState() => _WelcomeHomePageState();
}

class _WelcomeHomePageState extends State<WelcomeHomePage> {
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
          child: Stack(children: [
            // Background
            Container(
              decoration: const BoxDecoration(
                color: primaryColor,
              ),
            ),
            // Background White
            Container(
              margin: const EdgeInsets.only(top: 80.0),
              decoration: const BoxDecoration(
                color: whiteFlat,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
            ),
            // Body
            Column(
              children: const [
                CompWelAppBar(),
                // Padding(
                //   padding: EdgeInsets.only(top: 30.0),
                //   child: CompReferralCard(),
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 10.0),
                //   child: CompWelTenantCard(),
                // )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
