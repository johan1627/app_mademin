import 'package:flutter/material.dart';

class AvatarUrl extends StatelessWidget {
  final String? url;
  final double? sizeWidth;
  final double? sizeHeight;
  final double? sizeRadius;

  const AvatarUrl(
      {super.key, this.url, this.sizeWidth, this.sizeHeight, this.sizeRadius});

  @override
  Widget build(BuildContext context) {
    var urel = "";
    if (url == "") {
      urel =
          "https://ui-avatars.com/api/?name=blank&size=128&color=B39DDB&background=E8EAF6";
    } else {
      urel = url!;
    }

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(sizeRadius!)),
      child: Image.network(urel,
          width: sizeWidth, // width
          height: sizeHeight, // height
          fit: BoxFit.cover, errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
        return SizedBox(
          width: sizeWidth, // width
          height: sizeHeight, // height
          child: Image.network(
            "https://ui-avatars.com/api/?name=blank&size=128&color=B39DDB&background=E8EAF6",
            width: sizeWidth, // width
            height: sizeHeight, // height
          ),
        );
      }),
    );
  }
}

class AvatarAsset extends StatelessWidget {
  final String imgAsset;
  final double sizeWidth;
  final double sizeHeight;
  final double sizeRadius;

  const AvatarAsset(
      {super.key,
      required this.imgAsset,
      required this.sizeWidth,
      required this.sizeHeight,
      required this.sizeRadius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(sizeRadius)),
      child: Image.asset(imgAsset,
          width: sizeWidth, // width
          height: sizeHeight, // height
          fit: BoxFit.fitWidth, errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
        return SizedBox(
          width: sizeWidth, // width
          height: sizeHeight, // height
          child: Image.asset(
            "assets/img/placeholder-01.png",
            fit: BoxFit.cover,
          ),
        );
      }),
    );
  }
}
