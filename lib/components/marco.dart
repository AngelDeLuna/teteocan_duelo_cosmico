
import 'dart:ui';

import 'package:flame/components.dart';

class Marco extends PositionComponent {
  final double strokeWidth;
  final Color color;

  Marco({required Vector2 size, this.strokeWidth = 6.0, this.color = const Color(0xFFFFFFFF)}) {
    this.size = size;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), paint);
  }
}
