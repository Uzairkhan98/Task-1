import 'package:flutter/material.dart';

class expansionWidget extends StatelessWidget {
  const expansionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 25,
      child: Container(
        color: const Color(0xff1ba1a5),
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
        child: SafeArea(
          child: Container(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
