import 'package:flutter/material.dart';

class IEasyDialog2 extends StatefulWidget {
  final Color color;
  final Color backgroundColor;
  final ValueSetter<double> setPosition;
  final ValueGetter<double> getPosition;
  final Widget body;

  const IEasyDialog2({
    super.key,
    this.color = Colors.black,
    required this.setPosition,
    required this.getPosition,
    required this.body,
    this.backgroundColor = Colors.white,
  });

  @override
  _IEasyDialog2State createState() => _IEasyDialog2State();
}

class _IEasyDialog2State extends State<IEasyDialog2> {
  final ValueNotifier<double> _rowHeight = ValueNotifier<double>(-1);
  final GlobalKey _rowKey = GlobalKey();
  bool _needRedraw = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_rowKey.currentContext != null) {
        _rowHeight.value = _rowKey.currentContext!.size!.height;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        if (widget.getPosition() != 0) {
          widget.setPosition(0);
          return false;
        }
        return true;
      },
      child: Stack(
        children: [
          if (widget.getPosition() != 0)
            Container(
              width: windowWidth,
              height: windowHeight,
              color: Colors.black.withOpacity(0.5),
            ),
          ValueListenableBuilder<double>(
            valueListenable: _rowHeight,
            builder: (context, height, child) {
              if (_needRedraw && height != -1) {
                _needRedraw = false;
                widget.setPosition(height + 100);
              }
              return const SizedBox.shrink();
            },
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            height: widget.getPosition(),
            bottom: 0,
            child: Container(
              width: windowWidth,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  GestureDetector(
                    onVerticalDragUpdate: (details) {
                      widget.setPosition(widget.getPosition() - details.delta.dy);
                    },
                    onVerticalDragEnd: (details) {
                      if (widget.getPosition() > _rowHeight.value / 2) {
                        widget.setPosition(_rowHeight.value + 100);
                      } else {
                        widget.setPosition(0);
                      }
                      setState(() {
                        _needRedraw = true;
                      });
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: widget.color,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 100,
                              height: 2,
                              color: widget.color,
                            ),
                            const SizedBox(height: 2),
                            Container(
                              width: 100,
                              height: 2,
                              color: widget.color,
                            ),
                            const SizedBox(height: 2),
                            Container(
                              width: 100,
                              height: 2,
                              color: widget.color,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    key: _rowKey,
                    child: widget.body,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}