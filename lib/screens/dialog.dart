import 'dart:typed_data';
import 'package:flutter/material.dart';

class DisplayCapturedImageDialog extends StatelessWidget {
  final Uint8List? imageBytes;

  const DisplayCapturedImageDialog({Key? key, this.imageBytes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Captured Image'),
      content: SingleChildScrollView(
        child: Center(
          child: imageBytes != null
              ? Image.memory(
                  imageBytes!,
                  fit: BoxFit.contain,
                )
              : Text('No image captured'),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
