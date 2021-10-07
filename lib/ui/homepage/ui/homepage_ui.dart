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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonContainer(check: true, context: context),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
            child: Text('Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.25,
                  fontSize: 20.0,
                )),
          ),
        ],
      ),
    );
  }
}
