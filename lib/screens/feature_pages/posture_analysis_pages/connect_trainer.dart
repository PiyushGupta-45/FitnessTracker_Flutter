import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class ConnectTrainerPage extends StatefulWidget {
  const ConnectTrainerPage({super.key});

  @override
  State<ConnectTrainerPage> createState() => _ConnectTrainerPageState();
}

class _ConnectTrainerPageState extends State<ConnectTrainerPage> {
  bool isUploading = false;
  String? uploadedFileURL;

  Future<void> pickAndUploadVideo() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null && result.files.single.path != null) {
      File file = File(result.files.single.path!);

      setState(() => isUploading = true);

      try {
        final storageRef = FirebaseStorage.instance.ref().child(
          'trainer_videos/${DateTime.now().millisecondsSinceEpoch}.mp4',
        );

        final uploadTask = await storageRef.putFile(file);
        final downloadURL = await storageRef.getDownloadURL();

        setState(() {
          uploadedFileURL = downloadURL;
          isUploading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Video uploaded successfully')),
        );
      } catch (e) {
        setState(() => isUploading = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Upload failed: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connect with Trainer')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Upload a video for your trainer',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.upload),
              label: const Text('Select & Upload Video'),
              onPressed: isUploading ? null : pickAndUploadVideo,
            ),
            if (isUploading) const CircularProgressIndicator(),
            if (uploadedFileURL != null) ...[
              const SizedBox(height: 20),
              Text(
                'Download URL:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SelectableText(uploadedFileURL!),
            ],
          ],
        ),
      ),
    );
  }
}
