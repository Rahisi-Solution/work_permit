import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class VerifyPermit extends StatefulWidget {
  const VerifyPermit({super.key});

  @override
  State<VerifyPermit> createState() => _VerifyPermitState();
}

class _VerifyPermitState extends State<VerifyPermit> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  bool isCameraInitialized = false;
  bool flashOn = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      cameras = await availableCameras();
      cameraController = CameraController(cameras[0], ResolutionPreset.high);
      await cameraController.initialize();
      setState(() {
        isCameraInitialized = true;
      });
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

  void _toggleFlash() async {
    if (cameraController.value.isInitialized) {
      flashOn = !flashOn;
      await cameraController.setFlashMode(flashOn ? FlashMode.torch : FlashMode.off);
      setState(() {});
    }
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: isCameraInitialized
          ? Stack(
        children: [
          CameraPreview(cameraController),
          _buildOverlay(), // The green scanning frame
          Positioned(
            top: 50,
            right: 16,
            child: TextButton(
              onPressed: _toggleFlash,
              child: Text(
                flashOn ? 'Flash On' : 'Flash Off',
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  // This widget creates the green scanning frame
  Widget _buildOverlay() {
    return Center(
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 4),
        ),
      ),
    );
  }
}
