import 'package:flame_rive/flame_rive.dart';

class Player extends RiveComponent{
  final Artboard playerArtboard;
  late final RiveComponent player;
  Player({required this.playerArtboard}): super(artboard: playerArtboard);
  
  Future<void> onLoad() async{
    player = RiveComponent(artboard: playerArtboard);
  }
}
