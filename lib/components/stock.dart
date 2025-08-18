import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:teteocan_duelo_cosmico/game/teteocan_game.dart';

class Stock extends PositionComponent with TapCallbacks {
  Stock();
  // @override
  // bool get debugMode => true;

  @override
  void onTapDown(TapDownEvent event) {
    // Avisar al juego que se tocó el stock
    (parent!.parent as TeteocanGame).togglePiles();
  }
}