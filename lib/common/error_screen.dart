import 'package:flutter/material.dart';

class ErrorScreen {
  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
