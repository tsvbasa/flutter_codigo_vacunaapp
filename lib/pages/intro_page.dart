import 'package:flutter/material.dart';
import 'package:flutter_codigo_vacunaapp/pages/home_page.dart';
import 'package:flutter_codigo_vacunaapp/ui/widgets/button_normal_widget.dart';
import 'package:flutter_codigo_vacunaapp/utils/constants.dart';
import 'package:flutter_svg/svg.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Tu carnet de vacunación",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                height: 1,
                color: kFontPrimaryColor,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Con esta App podrás gestionar los carnets de las personas que prefieras. No olvides ser responsable.",
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
                color: kFontPrimaryColor.withOpacity(0.7),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ButtonNormalWidget(
              text: "Iniciar ahora",
              icon: "virus",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
