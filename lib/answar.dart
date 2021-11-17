import 'package:flutter/material.dart';

class Answare extends StatelessWidget {
  final String answar;
  final void Function() onAnswarClick;

  const Answare(this.answar, this.onAnswarClick, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        child: Text(
          answar,
          style: const TextStyle(color: Colors.white),
        ),
        onPressed: onAnswarClick,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
        ),
      ),
    );
  }
}
