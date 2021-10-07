import 'package:eat_ziffy_task/common/common_ui.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  bool check;
  HomePage({this.check});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF8F8F8),
      body: Column(
        children: [
          commonContainer(check: true, context: context),
        ],
      ),
    );
  }
}
