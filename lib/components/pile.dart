import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:teteocan_duelo_cosmico/game/teteocan_game.dart';

class Pile extends PositionComponent with HoverCallbacks, TapCallbacks{

  Pile(this.sprite);

  final Sprite sprite;
  final double hoverScale = 2.5; // cuánto se agranda al pasar el mouse
  late Vector2 originalSize;
  late Vector2 originalPosition;


  // @override
  // bool get debugMode => true;

  @override
  Future<void> onLoad() async {
    originalSize = size.clone();
    originalPosition = position.clone();
  }

    @override
  void render(Canvas canvas) {
    super.render(canvas);
    sprite.render(canvas, size: size); // siempre del tamaño actual

      final paint = Paint()
    ..color = const Color(0xFFFFFFFF) // color del marco
    ..style = PaintingStyle.stroke
    ..strokeWidth = 8.0; // grosor del borde

  canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), paint);
  }

  @override
  void onHoverEnter() {
    size = originalSize * hoverScale;
    position = originalPosition - (size - originalSize) / 2;
  }

  @override
  void onHoverExit() {
    size = originalSize.clone();
    position = originalPosition.clone();
  }

  @override
  void onTapUp(TapUpEvent event) {
    (parent!.parent as TeteocanGame).mostrarCartaCentral(sprite);
  }

}