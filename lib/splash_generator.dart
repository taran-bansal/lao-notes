import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';

void main() async {
  // Create a recorder
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);

  // Set size to 1152x1152 (recommended size for splash screen)
  const size = Size(1152, 1152);

  // Draw white background
  final paint = Paint()..color = Colors.white;
  canvas.drawRect(Offset.zero & size, paint);

  // Draw text
  final textPainter = TextPainter(
    text: const TextSpan(
      text: 'Notes App',
      style: TextStyle(
        color: Colors.blue,
        fontSize: 72,
        fontWeight: FontWeight.bold,
      ),
    ),
    textDirection: TextDirection.ltr,
  );

  textPainter.layout();
  textPainter.paint(
    canvas,
    Offset(
      (size.width - textPainter.width) / 2,
      (size.height - textPainter.height) / 2,
    ),
  );

  // Convert to image
  final picture = recorder.endRecording();
  final img = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
  final buffer = byteData!.buffer.asUint8List();

  // Get the documents directory
  final directory = await getApplicationDocumentsDirectory();
  final splashDir = Directory('${directory.path}/splash');

  // Create the splash directory if it doesn't exist
  if (!await splashDir.exists()) {
    await splashDir.create(recursive: true);
  }

  // Save to file
  final file = File('${splashDir.path}/splash_logo.png');
  await file.writeAsBytes(buffer);

  print('Splash screen icon generated successfully at: ${file.path}');
  exit(0);
}
