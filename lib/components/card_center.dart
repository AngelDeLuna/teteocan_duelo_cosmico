import 'dart:ui';
import 'package:flame/components.dart';

class Card_Center extends PositionComponent {
  Sprite sprite;
  Card_Center(this.sprite);
  
  // @override
  // bool get debugMode => true;

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

}