import 'package:flutter/material.dart';

class ArrowClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // 자식의 사이즈를 가지고 옴
    // print(size)
    // 0,0 , 0,20 , 20,0 , 20,20
    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width * 0.5, 0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  //화면이 바뀔때 그림을 다시 그릴 것인가 ?
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
