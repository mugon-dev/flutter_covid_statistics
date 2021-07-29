import 'package:flutter/material.dart';

enum ArrowDirection { UP, MIDDLE, DOWN }

class ArrowClipPath extends CustomClipper<Path> {
  ArrowDirection direction;
  ArrowClipPath({required this.direction});
  @override
  Path getClip(Size size) {
    // 자식의 사이즈를 가지고 옴
    // print(size)
    // 0,0 , 0,20 , 20,0 , 20,20
    var path = Path();
    switch (direction) {
      case ArrowDirection.UP:
        path.moveTo(0, size.height);
        path.lineTo(size.width * 0.5, 0);
        path.lineTo(size.width, size.height);
        path.close();
        break;
      case ArrowDirection.MIDDLE:
        path.moveTo(0, size.height * 0.4);
        path.lineTo(size.width, size.height * 0.4);
        path.lineTo(size.width, size.height * 0.6);
        path.lineTo(0, size.height * 0.6);
        path.close();
        break;
      case ArrowDirection.DOWN:
        path.moveTo(0, 0);
        path.lineTo(size.width * 0.5, size.height);
        path.lineTo(size.width, 0);
        path.close();
        break;
    }

    return path;
  }

  //화면이 바뀔때 그림을 다시 그릴 것인가 ?
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
