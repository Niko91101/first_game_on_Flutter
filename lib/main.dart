import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lesson_1/gameCore/game.dart';
import 'package:lesson_1/gameCore/main_loop.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).whenComplete(() {
      SystemChrome.setEnabledSystemUIOverlays([
        SystemUiOverlay.bottom
      ]);

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Game()
    ),
  );
    
  });
}