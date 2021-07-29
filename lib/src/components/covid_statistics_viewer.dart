import 'package:covid_statistics/src/canvas/arrow_clip_path.dart';
import 'package:covid_statistics/src/utils/data_utils.dart';
import 'package:flutter/material.dart';

class CovidStatisticsViewer extends StatelessWidget {
  final String title;
  final double addedCount;
  final ArrowDirection upDown;
  final double totalCount;
  final bool dense;
  final Color titleColor;
  final Color subValueColor;
  final double spacing;

  const CovidStatisticsViewer({
    Key? key,
    required this.title,
    required this.addedCount,
    required this.upDown,
    required this.totalCount,
    this.dense = false,
    this.titleColor = const Color(0xff4c4e5d),
    this.subValueColor = Colors.black,
    this.spacing = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Colors.black;
    switch (upDown) {
      case ArrowDirection.UP:
        color = Color(0xffcf5f51);
        break;
      case ArrowDirection.MIDDLE:
        break;
      case ArrowDirection.DOWN:
        color = Color(0xff3749be);
        break;
    }
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(color: titleColor, fontSize: dense ? 14 : 18),
        ),
        SizedBox(
          height: spacing,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: ArrowClipPath(direction: upDown),
              child: Container(
                width: dense ? 10 : 20,
                height: dense ? 10 : 20,
                color: color,
              ),
            ),
            SizedBox(width: 5),
            Text(
              DataUtils.numberFormat(addedCount),
              style: TextStyle(
                  color: color,
                  fontSize: dense ? 25 : 50,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: spacing * 0.5,
        ),
        Text(
          DataUtils.numberFormat(totalCount),
          style: TextStyle(
              color: dense ? subValueColor : Colors.white,
              fontSize: dense ? 15 : 20),
        ),
      ],
    );
  }
}
