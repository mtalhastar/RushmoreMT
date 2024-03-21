import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class DisplayCapturedImageDialog extends StatelessWidget {
  final File? files;

  const DisplayCapturedImageDialog({Key? key, this.files}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Captured Image'),
      content: SingleChildScrollView(
        child: Center(
          child: files != null
              ? Image.file(
                  files!,
                  fit: BoxFit.contain,
                )
              : const Text('No image captured'),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child:const Text('Close'),
        ),
      ],
    );
  }
}
