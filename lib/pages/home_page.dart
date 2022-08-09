import 'package:flutter/material.dart';
import 'package:flutter_codigo_vacunaapp/pages/scanner_qr_page.dart';
import 'package:flutter_codigo_vacunaapp/ui/widgets/button_normal_widget.dart';
import 'package:flutter_codigo_vacunaapp/ui/widgets/item_list_widget.dart';
import 'package:flutter_codigo_vacunaapp/utils/constants.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mis carnets registrados",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: kFontPrimaryColor.withOpacity(0.85),
                  ),
                ),
                const SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    // shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int indez) {
                      return ItemListWidget();
                    },
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ButtonNormalWidget(
                text: "Escanear QR",
                icon: 'qr-scan',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ScannerQRPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
