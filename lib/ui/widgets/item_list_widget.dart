import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/constants.dart';

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: Offset(4, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/user.svg',
                      height: 14,
                      color: kFontPrimaryColor.withOpacity(0.7),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Nombre completo",
                      style: TextStyle(
                        fontSize: 13,
                        color: kFontPrimaryColor.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Fiorella de Fátima Montes",
                  style: TextStyle(
                    fontSize: 14,
                    color: kFontPrimaryColor.withOpacity(0.9),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/id_card.svg',
                      height: 14,
                      color: kFontPrimaryColor.withOpacity(0.7),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "DNI",
                      style: TextStyle(
                        fontSize: 13,
                        color: kFontPrimaryColor.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                Text(
                  "70008890",
                  style: TextStyle(
                    fontSize: 14,
                    color: kFontPrimaryColor.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/link.svg',
              color: kFontPrimaryColor.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}
