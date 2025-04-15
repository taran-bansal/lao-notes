import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  // Initialize Flutter bindings
  WidgetsFlutterBinding.ensureInitialized();

  // Get the documents directory where the splash screen was generated
  final directory = await getApplicationDocumentsDirectory();
  final sourceFile = File('${directory.path}/splash/splash_logo.png');

  // Create assets/images directory if it doesn't exist
  final assetsDir = Directory('assets/images');
  if (!await assetsDir.exists()) {
    await assetsDir.create(recursive: true);
  }

  // Copy the file to assets/images
  final targetFile = File('assets/images/splash_logo.jpeg');
  await sourceFile.copy(targetFile.path);

  print('Splash screen copied successfully to: ${targetFile.path}');
  exit(0);
}
