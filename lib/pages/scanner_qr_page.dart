import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_codigo_vacunaapp/pages/register_page.dart';
import 'package:flutter_codigo_vacunaapp/ui/general/colors.dart';
import 'package:flutter_codigo_vacunaapp/ui/widgets/button_normal_widget.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerQRPage extends StatefulWidget {
  const ScannerQRPage({Key? key}) : super(key: key);

  @override
  State<ScannerQRPage> createState() => _ScannerQRPageState();
}

class _ScannerQRPageState extends State<ScannerQRPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  String patternUrl = r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
  String dataUrl = "";
  bool isUrl = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: kBrandPrimaryColor,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 7,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    RegExp regExp = RegExp(patternUrl);

    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result != null){
          dataUrl = result!.code!;
          isUrl = regExp.hasMatch(dataUrl);
        }
      });
    });
    controller.pauseCamera();
    controller.resumeCamera();
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: _buildQrView(context),
            // child: Container(
            //   color: Colors.indigo,
            // ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(14),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    !isUrl ? dataUrl : "Por favor escanea un carnet",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 10,),
                  ButtonNormalWidget(
                    text: "Registrar carnet",
                    icon: 'check',
                    onTap: !isUrl ? (){
                      dataUrl = "https://regexr.com";
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(url: dataUrl,)));
                    } : null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
