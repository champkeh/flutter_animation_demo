import 'package:flutter/material.dart';
import 'dart:ui';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    printMediaQuery('MyWidget', context);
    printWindowInfo();

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: TextFormField(
                initialValue: 'Text Form Field',
              ),
            ),
            Center(
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Builder(
                  builder: (context) {
//                    printMediaQuery('Build', context);
//                    printWindowInfo();
                    return Container(
                      color: Colors.red,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  printMediaQuery(String label, BuildContext context) {
//    print('$label:\n${MediaQuery.of(context)}');
    RenderObject renderObject = context.findRenderObject();
    RenderBox renderBox = renderObject as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    Rect widgetRect = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      renderBox.size.width,
      renderBox.size.height,
    );
    print(offset);
    print(widgetRect);

    final keyboardTopPixels =
        window.physicalSize.height - window.viewInsets.bottom;
    final keyboardTopPoints = keyboardTopPixels / window.devicePixelRatio;
    print(keyboardTopPixels);
    print(keyboardTopPoints);
    print(window);
  }

  printWindowInfo() {
    print(window.devicePixelRatio);
    print(window.physicalSize);
    print(window.viewInsets);
    print(window.locales);
  }
}
