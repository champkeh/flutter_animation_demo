import 'package:flutter/material.dart';

class SwipeDemoRoute extends StatefulWidget {
  @override
  _SwipeDemoRouteState createState() => _SwipeDemoRouteState();
}

class _SwipeDemoRouteState extends State<SwipeDemoRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: List.generate(42, (index) {
            return SlideMenu(
              child: ListTile(
                title: Container(
                  child: Text('Drag me'),
                ),
              ),
              menuItems: <Widget>[
                Container(
                  child: IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                ),
                Container(
                  child: IconButton(icon: Icon(Icons.info), onPressed: () {}),
                )
              ],
            );
          }),
        ).toList(),
      ),
    );
  }
}

class SlideMenu extends StatefulWidget {
  SlideMenu({this.child, this.menuItems});

  final Widget child;
  final List<Widget> menuItems;

  @override
  _SlideMenuState createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animtaion =
        Tween(begin: Offset(0, 0), end: Offset(-0.2, 0)).animate(_controller);

    return GestureDetector(
      onHorizontalDragUpdate: (data) {
        // we can access context.size here
        setState(() {
          _controller.value -= data.primaryDelta / context.size.width;
        });
      },
      onHorizontalDragEnd: (data) {
        if (data.primaryVelocity > 2500) {
          // close menu on fast swipe in the right direction
          _controller.animateTo(0);
        } else if (_controller.value >= .5 || data.primaryVelocity < -2500) {
          // fully open if dragged a lot to left or on fast swipe to left
          _controller.animateTo(1);
        } else {
          // close if none of above
          _controller.animateTo(0);
        }
      },
      child: Stack(
        children: <Widget>[
          SlideTransition(
            position: animtaion,
            child: widget.child,
          ),
          Positioned.fill(
            child: LayoutBuilder(
              builder: (context, constraint) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Stack(
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            color: Colors.black26,
                            child: Row(
                              children: widget.menuItems.map((child) {
                                return Expanded(child: child);
                              }).toList(),
                            ),
                          ),
                          top: 0,
                          bottom: 0,
                          right: 0,
                          width: constraint.maxWidth * animtaion.value.dx * -1,
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
