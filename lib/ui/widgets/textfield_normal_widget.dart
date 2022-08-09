import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants.dart';

class TextFieldNormalWidget extends StatelessWidget {
  String hintText;
  String icon;
  bool isDNI;


  TextFieldNormalWidget({
    required this.hintText,
    required this.icon,
    required this.isDNI,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: const Offset(4, 4),
          blurRadius: 12,
        )
      ]),
      child: TextField(
        keyboardType: isDNI ? TextInputType.number : null,
        maxLength: isDNI ? 8 : null,
        style:
            TextStyle(fontSize: 14, color: kFontPrimaryColor.withOpacity(0.9)),
        inputFormatters: isDNI ? [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ] : [],
        decoration: InputDecoration(
            counterText: "",
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14,
              color: kFontPrimaryColor.withOpacity(0.45),
            ),
            prefixIcon: SvgPicture.asset(
              'assets/icons/$icon.svg',
              fit: BoxFit.scaleDown,
              color: kFontPrimaryColor.withOpacity(0.45),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 18,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
