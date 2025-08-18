import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:teteocan_duelo_cosmico/components/marco.dart';

import 'package:teteocan_duelo_cosmico/components/pile.dart';
import 'package:teteocan_duelo_cosmico/components/stock.dart';
import 'package:teteocan_duelo_cosmico/components/card_center.dart';

class TeteocanGame extends FlameGame {
  static const double cardGap = 175.0;
  static const double cardWidth = 1000.0;
  static const double cardHeight = 1400.0;
  static const double cardRadius = 100.0;
  static final Vector2 cardSize = Vector2(cardWidth, cardHeight);

  Card_Center? cartaCentral;

  //Sprite de pile
  List<List<double>> matriz = [
  [335,164, 120, 129],
  [20,  19,  83, 125],
  [122, 19,  80, 127],
  [213, 12,  93, 132],
  [314, 21,  85, 125],
  [419, 17,  84, 129],
  [509, 21,  92, 128],
  [612, 19,  78, 127],
];

  bool pilesMostradas = false;
  List<Pile> piles = []; // Guardamos las piles


  @override
  Future<void> onLoad() async {
    await Flame.images.load('numeros-sprites.png');

    final stock = Stock()
      ..size = cardSize
      ..position = Vector2(cardGap, cardGap);

    final stockSprite = SpriteComponent(
      sprite: teteocan(1367, 6, 357, 501),
      size: cardSize,
    );
    stock.add(stockSprite);

    // Agregar el marco como hijo
    final marco = Marco(size: cardSize);
    stock.add(marco);

    world.add(stock);

    camera.viewfinder.visibleGameSize =
        //Vector2(cardWidth * 7 + cardGap * 8, 4 * cardHeight + 3 * cardGap);
        Vector2(cardWidth * 3 + cardGap * 4, 4 * cardHeight + 5 * cardGap);
    camera.viewfinder.position = Vector2((3*cardWidth + 4*cardGap)/2,0);
    camera.viewfinder.anchor = Anchor.topCenter;

  }

  void togglePiles() {
    if (!pilesMostradas) {
      // Crear y mostrar piles
      piles = List.generate(
        8,
        (i) => Pile(
            teteocan(matriz[i][0], matriz[i][1], matriz[i][2], matriz[i][3])
          )
            ..size = cardSize / 4
            ..position = Vector2(
              cardGap + cardWidth / 2 - cardWidth / 8,
              cardHeight + cardGap * 2 + i * (cardHeight / 4 + cardGap),
              ),
      );
      world.addAll(piles);
      pilesMostradas = true;

    } else {
      // Eliminar piles del mundo
      for (var pile in piles) {
        pile.removeFromParent();
      }
      cartaCentral?.removeFromParent();
      cartaCentral = null;
      pilesMostradas = false;
    }
  }

  void mostrarCartaCentral(sprite) {
    if (cartaCentral == null) {
        cartaCentral = Card_Center(sprite)
      ..size = cardSize
      //..position = camera.viewport.virtualSize / 2 - cardSize/2;
      ..position = Vector2(camera.viewfinder.position.x,  (3 * cardHeight + 4 * cardGap)/2);
    
    world.add(cartaCentral!);
    }else{
      cartaCentral!.sprite = sprite;
    }
  }
}

Sprite teteocan(double x, double y, double width, double height) {
  return Sprite(
    Flame.images.fromCache('numeros-sprites.png'),
    srcPosition: Vector2(x, y),
    srcSize: Vector2(width, height),
  );
}
