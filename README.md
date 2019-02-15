# Flutter Animation Demo

>这个项目用于学习Flutter中的Animation，并尝试写出(收集)各种炫酷的动画效果。


## Animation相关教程
1. [官方文档中的动画介绍](https://flutter.io/docs/development/ui/animations)
2. [《Flutter实战》电子书中的动画章节](https://book.flutterchina.club/chapter9/)


## Animation示例

### StaggerAnimation
<table>
  <tr>
    <td><img src="/assets/screenshot/stagger_animation_1.gif" /></td>
    <td><img src="/assets/screenshot/stagger_animation_2.gif" /></td>
  </tr>
</table>

核心代码如下:
```dart
class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.controller}) : super(key:key) {
    height = Tween<double>(begin: 0, end: 300).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeOut),
        reverseCurve: Interval(0.0, 0.5, curve: Curves.easeIn)));

    ColorTween colorTween1 = ColorTween(begin: Colors.red, end: Colors.green);
    ColorTween colorTween2 = ColorTween(begin: Colors.green, end: Colors.blue);
    color = TweenSequence([
      TweenSequenceItem(tween: colorTween1, weight: 50),
      TweenSequenceItem(tween: colorTween2, weight: 50),
    ]).animate(controller);

    padding = Tween<EdgeInsets>(
      begin: EdgeInsets.only(left: .0),
      end: EdgeInsets.only(left: 250.0),
    )
        .chain(CurveTween(curve: Interval(0.5, 1.0, curve: Curves.ease)))
        .animate(controller);
  }

  final AnimationController controller;
  Animation<double> height;
  Animation<Color> color;
  Animation<EdgeInsets> padding;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          alignment: Alignment.bottomLeft,
          padding: padding.value,
          child: Container(
            color: color.value,
            width: 50,
            height: height.value,
          ),
        );
      },
    );
  }
}
```

### AnimatedList
<table>
  <tr>
    <td><img src="/assets/screenshot/animated_list_animation_1.gif" style="width:400px;" /></td>
  </tr>
</table>

这个动画主要用到了`AnimatedList`这个系统提供的widget
