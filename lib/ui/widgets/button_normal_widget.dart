import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonNormalWidget extends StatelessWidget {
  String text;
  String icon;
  Function? onTap;

  ButtonNormalWidget({
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: onTap != null
            ? () {
                onTap!();
              }
            : null,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          primary: Color(0xff7248E5),
        ),
        icon: SvgPicture.asset(
          'assets/icons/$icon.svg',
          color: onTap!= null ? Colors.white : Colors.black38,
        ),
        label: Text(
          text,
        ),
      ),
    );
  }
}
