import 'package:flutter/material.dart';

import './answar.dart';

class Answares extends StatelessWidget {
  final List<Map<String, Object>> answares;
  final void Function(int) onAnswarClick;

  const Answares(this.answares, this.onAnswarClick, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...answares
            .map(
              (answar) => Answare(
                answar["text"] as String,
                () {
                  onAnswarClick(answar["score"] as int);
                },
              ),
            )
            .toList()
      ],
    );
  }
}
