import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:hackathon24/player.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Supabase.initialize(
    url: 'https://srneluayrtckhtrwdfqd.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNybmVsdWF5cnRja2h0cndkZnFkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQyMTA5NjAsImV4cCI6MjAyOTc4Njk2MH0.kH-dnm69SGX8gS5wlBYKdonZkY2KzfK59g_cog2idE4',
  );
  RiveFile riveFile = await RiveFile.asset('assets/rive/rive.riv');
  Flame.device.fullScreen();
  runApp(GameWidget(game: SumoWrestlerGame(riveFile: riveFile)));
}

class SumoWrestlerGame extends FlameGame with HasGameRef {
  final RiveFile riveFile;
  SumoWrestlerGame({required this.riveFile});
  late Player player;
  late Player opponent;
  @override
  Future<void> onLoad() async {
    player =
        Player(playerArtboard: riveFile.artboardByName('Player')!, isMe: true)
          ..position = Vector2(gameRef.size.x / 2, gameRef.size.y / 2)
          ..anchor = Anchor.center
          ..size = Vector2(25, 25);
    opponent =
        Player(playerArtboard: riveFile.artboardByName('Player')!, isMe: false)
          ..position = Vector2(gameRef.size.x / 2, gameRef.size.y / 2)
          ..size = Vector2(25, 25);
  }
}
