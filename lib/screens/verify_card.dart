import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../helper/appcolors.dart';
import '../helper/size_config.dart';

class VerifyCard extends StatefulWidget {
  const VerifyCard({super.key});

  @override
  State<VerifyCard> createState() => _VerifyCardState();
}

class _VerifyCardState extends State<VerifyCard> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String result = "Scan a QR code";

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Card',
          style: TextStyle(
          fontSize: SizeConfig.textMultiplier * 2.5,
          color: Colors.white,
        ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 250,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                result,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData.code ?? "Scan a QR code";
      });
      // Here you can handle the scanned result, e.g., verifying the permit
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
