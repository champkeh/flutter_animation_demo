import 'package:flutter/material.dart';
import 'package:flutter_animation_demo/animation/chart_animation.dart';
import 'package:flutter_animation_demo/animation/stagger_animation.dart';
import 'package:flutter_animation_demo/animation/animation_list.dart';
import 'package:flutter_animation_demo/animation/spinner.dart';
import 'package:flutter_animation_demo/animation/slide_transition_demo.dart';
import 'package:flutter_animation_demo/swipe/swipe_demo.dart';
import 'package:flutter_animation_demo/keyboard/keyboard_avoider_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyWidget(),
    );
  }
}
