import 'package:flutter/material.dart';

class Statuses extends StatelessWidget {
  const Statuses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Status(
          status: true,
          title: "Ejection Status",
        ),
        Status(
          status: false,
          title: "Disreef Status",
        ),
        Status(
          status: true,
          title: "Battery Status",
        )
      ],
    ));
  }
}

class Status extends StatefulWidget {
  final bool status;
  final String title;
  const Status({this.status = false, required this.title, Key? key})
      : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              color: widget.status ? Color(0xFF03A400) : Color(0xFFCE0B0B)),
          child: Text(widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFFF1F1F1)))),
    );
  }
}
