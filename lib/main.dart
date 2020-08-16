import 'package:flutter/material.dart';
import 'package:reusable_widgets_h_v_scroll/src/pages/main_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reusable Widgets',
      home: MainPage()
    );
  }
}
