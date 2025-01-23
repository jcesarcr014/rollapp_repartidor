import 'dart:math';
import 'package:flutter/material.dart';

class ICard25 extends StatefulWidget {
  final Color color;
  final double width;
  final double height;
  final List<double> data;
  final List<double> data2;
  final String title;
  final List<String>? bottomTexts;
  final List<String>? bottomTexts2;
  final String actionText;
  final String actionText2;
  final TextStyle? titleStyle;
  final TextStyle? bottomTextStyle;
  final TextStyle? action;
  final Color colorLine;
  final Color shadowColor;
  final Color colorTimeIcon;
  final Color colorAction;

  const ICard25({
    super.key,
    this.color = Colors.white,
    this.width = 100,
    this.height = 100,
    this.title = "",
    this.bottomTexts,
    this.colorAction = Colors.green,
    this.titleStyle,
    this.bottomTextStyle,
    this.actionText = "",
    this.action,
    this.actionText2 = "",
    this.colorTimeIcon = Colors.black,
    this.data = const [],
    this.colorLine = Colors.white,
    this.shadowColor = Colors.white,
    this.bottomTexts2,
    this.data2 = const [],
  });

  @override
  _ICard25State createState() => _ICard25State();
}

class _ICard25State extends State<ICard25> {
  late TextStyle _titleStyle;
  late TextStyle _bottomTextStyle;
  late TextStyle _actionStyle;
  int _actionType = 1;

  @override
  void initState() {
    super.initState();
    _titleStyle = widget.titleStyle ?? const TextStyle(fontSize: 16);
    _bottomTextStyle = widget.bottomTextStyle ?? const TextStyle(fontSize: 14);
    _actionStyle = widget.action ?? const TextStyle(fontSize: 14);
  }

  List<Widget> _getVerticalText() {
    final items = <Widget>[];
    final dataList = _actionType == 1 ? widget.data : widget.data2;

    if (dataList.isNotEmpty) {
      final sortedData = List<double>.from(dataList)..sort();
      items.add(Text(sortedData.last.toStringAsFixed(0)));
      if (sortedData.length > 3) {
        items.add(Text(sortedData[sortedData.length ~/ 2].toStringAsFixed(0)));
      }
      items.add(Text(sortedData.first.toStringAsFixed(0)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final id = UniqueKey().toString();
    final bottomTextByType = _actionType == 1 ? widget.bottomTexts : widget.bottomTexts2;
    final dataByType = _actionType == 1 ? widget.data : widget.data2;
    final actionTextByType = _actionType == 1 ? widget.actionText : widget.actionText2;

    final xPoints = <Point<double>>[];

    if (dataByType.isNotEmpty) {
      final max = dataByType.reduce((a, b) => a > b ? a : b);
      final min = dataByType.reduce((a, b) => a < b ? a : b);

      final oneStep = (widget.width - 110) / (dataByType.length - 1);
      final onePercent = (widget.height * 0.5 - 20) / 100;
      double startX = 0.0;

      for (final dataItem in dataByType) {
        final normalizedValue = ((dataItem - min) / (max - min)) * 100;
        final yMargin = 10 + onePercent * normalizedValue;
        xPoints.add(Point(startX, (widget.height * 0.5 - yMargin) - 2));
        startX += oneStep;
      }
    }

    final bottomTextWidgets = bottomTextByType?.map((text) => Text(text, style: _bottomTextStyle)).toList() ?? [];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: widget.width,
      height: widget.height - 20,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: widget.width - 10,
              height: widget.height * 0.5,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: widget.height * 0.2, horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _getVerticalText(),
            ),
          ),
          Positioned(
            top: widget.height * 0.05,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: _titleStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _actionType = _actionType == 1 ? 2 : 1;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: widget.colorAction,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      actionTextByType,
                      style: _actionStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: bottomTextWidgets,
              ),
            ),
          ),
          Positioned(
            left: 50,
            top: widget.height * 0.2,
            child: SizedBox(
              width: widget.width,
              height: widget.height * 0.5,
              child: CustomPaint(
                painter: _ICard25Painter(xPoints, widget.colorLine, widget.shadowColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ICard25Painter extends CustomPainter {
  final List<Point<double>> points;
  final Color colorLine;
  final Color shadowColor;

  _ICard25Painter(this.points, this.colorLine, this.shadowColor);

  @override
  void paint(Canvas canvas, Size size) {
    final shadowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = shadowColor
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = colorLine;

    final dotPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    final path = Path();
    if (points.isNotEmpty) {
      path.moveTo(points.first.x, points.first.y);
      for (var i = 1; i < points.length; i++) {
        path.lineTo(points[i].x, points[i].y);
      }
    }

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, linePaint);

    for (final point in points) {
      canvas.drawCircle(Offset(point.x, point.y), 4, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Painter extends CustomPainter {
  final List<Point<double>> points;
  final Color colorLine;
  final Color shadowColor;

  Painter({
    required this.points,
    required this.colorLine,
    required this.shadowColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintLineShadow = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..color = shadowColor
      ..isAntiAlias = true
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    final paintLine = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..color = colorLine
      ..isAntiAlias = true;

    final paintDotsWhite = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white
      ..isAntiAlias = true;

    final paintDotsBack = Paint()
      ..style = PaintingStyle.fill
      ..color = colorLine
      ..isAntiAlias = true;

    final path = Path();
    if (points.isNotEmpty) {
      path.moveTo(points[0].x, points[0].y);

      for (int i = 1; i < points.length; i++) {
        final previousPoint = points[i - 1];
        final currentPoint = points[i];

        final controlPointX = (previousPoint.x + currentPoint.x) / 2;
        final controlPointY = (previousPoint.y + currentPoint.y) / 2;

        path.quadraticBezierTo(
          previousPoint.x,
          previousPoint.y,
          controlPointX,
          controlPointY,
        );
      }

      path.lineTo(points.last.x, points.last.y);
    }

    canvas.save();
    canvas.translate(0, 5);
    canvas.drawPath(path, paintLineShadow);
    canvas.restore();

    canvas.drawPath(path, paintLine);

    for (final point in points) {
      canvas.drawCircle(Offset(point.x, point.y), 4, paintDotsBack);
      canvas.drawCircle(Offset(point.x, point.y), 2, paintDotsWhite);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}