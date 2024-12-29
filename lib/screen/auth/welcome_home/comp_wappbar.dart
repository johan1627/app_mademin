import 'package:app_mademin/components/atoms/gen_avatar.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompWelAppBar extends StatefulWidget {
  const CompWelAppBar({super.key});

  @override
  State<CompWelAppBar> createState() => _CompWelAppBarState();
}

class _CompWelAppBarState extends State<CompWelAppBar> {
  @override
  Widget build(BuildContext context) {
    //
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    var authmo = authProvider.value;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "hello, ${authmo.name}",
                style: footFont.copyWith(color: whiteFlat),
              ),
              Text(
                "Ademin",
                style: lableFont.copyWith(color: whiteFlat),
              ),
            ],
          ),
          InkWell(
            // Go to
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (BuildContext context) => const ProfilePage(),
              // ));
            },
            child: AvatarUrl(
              url: authmo.profilePhotoPath,
              sizeWidth: 28,
              sizeHeight: 28,
              sizeRadius: 30,
            ),
          ),
        ],
      ),
    );
  }
}
