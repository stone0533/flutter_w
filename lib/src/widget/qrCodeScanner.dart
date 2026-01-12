import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class WQrView extends StatefulWidget {
  final Color borderColor;
  final Color checkedBorderColor;
  final WQrViewOverlayShape? overplay;
  final VoidCallback? noPermissionCallback;
  final void Function(Barcode scanData) onScanned;
  final void Function(QRViewController)? onQRViewCreated;
  const WQrView({
    super.key,
    this.borderColor = Colors.red,
    this.checkedBorderColor = Colors.red,
    this.overplay,
    this.noPermissionCallback,
    required this.onScanned,
    this.onQRViewCreated,
  });

  @override
  State<WQrView> createState() => _WQrViewState();
}

class _WQrViewState extends State<WQrView> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late Color borderColor;
  bool isOver = false;
  late WQrViewOverlayShape overlay;
  @override
  void initState() {
    borderColor = widget.borderColor;
    overlay = widget.overplay ?? WQrViewOverlayShape();
    super.initState();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: borderColor,
        borderWidth: overlay.borderWidth,
        overlayColor: overlay.overlayColor,
        borderRadius: overlay.borderRadius,
        borderLength: overlay.borderLength,
        cutOutWidth: overlay.cutOutWidth,
        cutOutHeight: overlay.cutOutHeight,
        cutOutBottomOffset: overlay.cutOutBottomOffset,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    widget.onQRViewCreated?.call(controller);
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      if (result != null) {
        String code = result!.code ?? '';
        if (code.isNotEmpty && borderColor != widget.checkedBorderColor) {
          setState(() {
            borderColor = widget.checkedBorderColor;
          });
          widget.onScanned.call(scanData);
        }
      }
      if (borderColor == widget.checkedBorderColor && isOver == false) {
        isOver = true;
        this.controller?.pauseCamera();
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      widget.noPermissionCallback?.call();
    }
  }
}

class WQrViewOverlayShape {
  final double borderWidth;
  final Color overlayColor;
  final double borderRadius;
  final double borderLength;
  final double cutOutWidth;
  final double cutOutHeight;
  final double cutOutBottomOffset;
  WQrViewOverlayShape({
    this.borderWidth = 3.0,
    this.overlayColor = const Color.fromRGBO(0, 0, 0, 0.5),
    this.borderRadius = 0,
    this.borderLength = 40,
    this.cutOutWidth = 250,
    double? cutOutHeight,
    this.cutOutBottomOffset = 0,
  }) : cutOutHeight = cutOutHeight ?? cutOutWidth;
}
