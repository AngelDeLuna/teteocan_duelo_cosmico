import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:teteocan_duelo_cosmico/game/teteocan_game.dart';

void main() {
  final game = TeteocanGame();
  runApp(GameWidget(game: game));
}