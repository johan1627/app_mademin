import 'package:app_mademin/components/atoms/gen_divider.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/components/molecules/genread.dart';
import 'package:app_mademin/config/config.dart';
import 'package:app_mademin/screen/auth/profile/comp_listtile.dart';
import 'package:app_mademin/components/atoms/gen_alert.dart';
import 'package:app_mademin/components/atoms/gen_avatar.dart';
import 'package:app_mademin/components/atoms/gen_button.dart';
import 'package:app_mademin/components/atoms/gen_function.dart';
import 'package:app_mademin/models/auth_model.dart';
import 'package:app_mademin/providers/auth_provider.dart';
import 'package:app_mademin/screen/auth/profile/profile_edit_page.dart';
import 'package:app_mademin/screen/auth/sign_in/home_root.dart';
import 'package:app_mademin/screen/auth/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ProfileHomePage extends StatefulWidget {
  final Authmo authmo;

  const ProfileHomePage({
    super.key,
    required this.authmo,
  });

  @override
  State<ProfileHomePage> createState() => _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage> {
  // import class function
  GeneralFunction function = GeneralFunction();

  // function
  Future<bool> _back() async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => HomeRoot(email: widget.authmo.email!),
    ));
    return true;
  }

  void _alertDeleteAccount(Authmo authmo) {
    showDialog(
      context: context,
      builder: (_) => AlertdialogDuaAction(
        title: 'Hapus Akun',
        content: 'Akun ${authmo.email} akan dihapus?',
        actionsatuOnTap: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
        actionduaOnTap: () {
          Navigator.of(context, rootNavigator: true).pop();
          deletedAccount(authmo.email);
        },
      ),
    );
  }

  void deletedAccount(String? email) async {
    var res = await Provider.of<AuthProvider>(context, listen: false)
        .deletedAccount(email!);

    if (res.statusCode == "200") {
      if (context.mounted) {
        // clear session
        Navigator.pop(context, true);
      }

      onSignOut();

      if (context.mounted) {
        function.snackBar(context, "Berhasil dihapus", 4);
      }
    } else {
      var message = res.message;

      final snackBar = SnackBar(
        content: Text(message),
        backgroundColor: redColor,
        action: SnackBarAction(
          label: 'OK',
          textColor: whiteFlat,
          onPressed: () {},
        ),
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  void _alertSignOut() {
    showDialog(
      context: context,
      builder: (_) => AlertdialogDuaAction(
        title: 'Keluar',
        content: 'Yakin mau keluar?',
        actionsatuOnTap: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
        actionduaOnTap: () {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.pop(context, true); // clear session
          onSignOut();
        },
      ),
    );
  }

  void onSignOut() async {
    var res = await Provider.of<AuthProvider>(context, listen: false).signOut();

    if (res.statusCode == "200") {
      if (context.mounted) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const SignInPage(),
        ));
      }
    } else {
      var message = res.message;
      Get.snackbar("Keluar", message,
          backgroundColor: redColor,
          colorText: whiteFlat,
          margin: const EdgeInsets.only(top: 4.0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GeneralReadPages(
      title: "Akun",
      subtitle: "Pengaturan Akun",
      dotmenu: const SizedBox(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                top: 20.0,
                bottom: 4.0,
              ),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AvatarUrl(
                          url: widget.authmo.profilePhotoPath,
                          sizeWidth: 52,
                          sizeHeight: 52,
                          sizeRadius: 30,
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.authmo.name}",
                              style: footFont.copyWith(color: blackFlat),
                            ),
                            Text(
                              "${widget.authmo.email}",
                              style: footFont.copyWith(color: blackLight),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            const DividerCustom(),
            const SizedBox(height: 10.0),

            // Informasi
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Akun", style: footFont),
              ),
            ),
            CompListTile(
              title: "Kelola Akun",
              icon: Icons.account_box,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ProfileEdit(
                    authmo: widget.authmo,
                  ),
                ));
              },
            ),
            CompListTile(
              title: "Hapus akun",
              icon: Icons.delete_outline,
              onTap: () {
                _alertDeleteAccount(widget.authmo);
              },
            ),

            // Informasi
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Informasi", style: footFont),
              ),
            ),

            CompListTile(
              title: "Kendala & Pertanyaan",
              icon: Icons.help_outline,
              onTap: () {
                function.getLaunchUrl("wa.me", "/$whatsappNumber&text=");
              },
            ),

            CompListTile(
              visible: false,
              title: "Berikan Rating",
              icon: Icons.star_outline,
              onTap: () {},
            ),

            CompListTile(
              title: "Kebijakan Pribadi",
              icon: Icons.health_and_safety_outlined,
              onTap: () {
                function.getLaunchUrl("noonapos.com", "/policy");
              },
            ),

            CompListTile(
              title: "Syarat & Ketentuan",
              icon: Icons.gpp_maybe_outlined,
              onTap: () {
                function.getLaunchUrl("noonapos.com", "/term");
              },
            ),

            // button
            ButtonWide(
              isLoading: false,
              isEnabled: true,
              type: "danger outline",
              onSaved: () {
                _alertSignOut();
              },
              lable: "Keluar",
              iconData: Icons.output_outlined,
            ),
            Text("versi $versionName", style: smallFont)
          ],
        ),
      ),
      onBack: _back,
    );
  }
}
