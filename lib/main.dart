import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:hackathon24/player.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RiveFile riveFile = await RiveFile.asset('assets/rive/rive.riv');
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  runApp(GameWidget(game: SumoWrestlerGame(riveFile: riveFile)));
}

class SumoWrestlerGame extends FlameGame with HasGameRef{
  final RiveFile riveFile;
  SumoWrestlerGame({required this.riveFile});
  @override
  Future<void> onLoad() async {
    add(Player(playerArtboard: riveFile.artboardByName('Player')!
    )
    ..position = Vector2(gameRef.size.x/2, gameRef.size.y/2)
    ..size = Vector2(100, 100),
    );
  }
}
