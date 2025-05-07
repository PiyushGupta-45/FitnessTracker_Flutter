import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class AIPostureDetector extends StatefulWidget {
  const AIPostureDetector({super.key});

  @override
  State<AIPostureDetector> createState() => _AIPostureDetectorState();
}

class _AIPostureDetectorState extends State<AIPostureDetector> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    await Permission.camera.request();

    _cameras = await availableCameras();
    if (_cameras != null && _cameras!.isNotEmpty) {
      _controller = CameraController(
        _cameras![1], // Front camera
        ResolutionPreset.medium,
      );
      await _controller!.initialize();
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Posture Detector')),
      body:
          _controller == null || !_controller!.value.isInitialized
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                children: [
                  CameraPreview(_controller!),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.black54,
                      child: const Text(
                        'Posture: Analyzing...',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}
