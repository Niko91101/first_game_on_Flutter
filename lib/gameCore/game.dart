import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lesson_1/gameCore/main_loop.dart';
import 'package:lesson_1/utilits/common_vars.dart';

import '../entities/player.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late ReceivePort _receivePort;
  late Isolate _isolateLoop;
  late Player player;

  void startIsolateLoop() async {
    _receivePort = ReceivePort();
    _isolateLoop = await Isolate.spawn(mainLoop,_receivePort.sendPort);
    _receivePort.listen((message) {
      setState(() {
       
        
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    if (isFirstStartGame) {
      startIsolateLoop();
      isFirstStartGame = false;
      player = Player();
    }
    player.update;

    return Stack(
      children: [
        player.build()
      ],
    );
  }
}