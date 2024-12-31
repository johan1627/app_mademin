import 'package:app_mademin/components/atoms/gen_button.dart';
import 'package:app_mademin/components/atoms/gen_function.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/providers/auth_provider.dart';
import 'package:app_mademin/screen/auth/welcome_home/comp_wappbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class WelcomeHomePage extends StatefulWidget {
  const WelcomeHomePage({super.key});

  @override
  State<WelcomeHomePage> createState() => _WelcomeHomePageState();
}

class _WelcomeHomePageState extends State<WelcomeHomePage> {
  // import
  GeneralFunction function = GeneralFunction();

  void share() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    var authmo = authProvider.value;
    var name = authmo.name;
    var email = authmo.email;
    //
    await Share.share(
        "Halo,\nsaya sudah install aplikasi Ademin,\nAkun $email.\nMohon dapat didaftarkan ke aplikasi Ademin.\nSalam, $name");
  }

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
              children: [
                const CompWelAppBar(),
                Container(
                  margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Image.asset(
                    'assets/img/assets-06.png',
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Kamu belum didaftarkan \noleh Ketua Lingkungan setempat \n(RT, Cluster, Residence)',
                  style: h3.copyWith(color: blackFlat),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Hubungi & Infokan Akun kamu',
                  style: h4.copyWith(color: blackFlat),
                  textAlign: TextAlign.center,
                ),
                ButtonWide(
                  isLoading: false,
                  isEnabled: true,
                  type: "primary",
                  lable: "Hubungi Ketua Lingkungan",
                  onSaved: () {
                    share();
                  },
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
