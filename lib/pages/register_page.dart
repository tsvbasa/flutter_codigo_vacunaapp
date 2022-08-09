import 'package:flutter/material.dart';
import 'package:flutter_codigo_vacunaapp/db/db_admin.dart';
import 'package:flutter_codigo_vacunaapp/models/license_model.dart';
import 'package:flutter_codigo_vacunaapp/ui/widgets/button_normal_widget.dart';
import 'package:flutter_codigo_vacunaapp/ui/widgets/textfield_normal_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../ui/general/colors.dart';

class RegisterPage extends StatelessWidget {
  String url;
  RegisterPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: kFontPrimaryColor,
        ),
        title: Text(
          "VacunaApp",
          style:
              TextStyle(color: kFontPrimaryColor, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Registrar nuevo carnet",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: kFontPrimaryColor.withOpacity(0.85),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFieldNormalWidget(
                  hintText: "Nombre completo",
                  icon: 'user',
                  isDNI: false,
                ),
                TextFieldNormalWidget(
                  hintText: "DNI",
                  icon: 'id_card',
                  isDNI: true,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Carnet QR",
                  style: TextStyle(
                    color: kFontPrimaryColor.withOpacity(0.75),
                    fontSize: 15,
                  ),
                ),
                QrImage(
                  data: url,
                  version: QrVersions.auto,
                  size: 220.0,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonNormalWidget(
              text: "Registrar carnet",
              icon: 'check',
              onTap: () {
                LicenseModel license = LicenseModel(
                  name: "Veronica Tellez",
                  dni: "70009876",
                  url: url,
                );

                DBAdmin.db.checkDatabase();
                DBAdmin.db.insertLicense(license).then((value) {
                  if (value > 0) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      behavior: SnackBarBehavior.floating,
                      content: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "El carnet se registró correctamente",
                          ),
                        ],
                      ),
                    ));
                  }
                });
              },
            ),
          ),
        ]),
      ),
    );
  }
}
