import 'package:flutter/material.dart';

class FieldContainer extends StatelessWidget {
  final Widget child;
  final String title;
  const FieldContainer({required this.child, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF024888),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.white),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 5)),
          Flexible(child: child),
        ],
      ),
    );
  }
}
