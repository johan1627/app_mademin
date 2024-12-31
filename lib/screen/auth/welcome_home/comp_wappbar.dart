import 'package:app_mademin/components/atoms/gen_avatar.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/providers/auth_provider.dart';
import 'package:app_mademin/screen/auth/profile/profile_root.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  "hello, ${authmo.name}",
                  overflow: TextOverflow.ellipsis,
                  style: footFont.copyWith(color: accentColor),
                ),
              ),
              Text(
                "temu warga",
                style: h1.copyWith(
                  color: accentColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          InkWell(
            // Go to
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const ProfileRoot(),
              ));
            },
            child: AvatarUrl(
              url: authmo.profilePhotoPath,
              sizeWidth: 36,
              sizeHeight: 36,
              sizeRadius: 30,
            ),
          ),
        ],
      ),
    );
  }
}
