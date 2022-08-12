// import 'package:flutter/material.dart';

// class CustomDropDownButton extends StatefulWidget {
//   final List<String> options;
//   const CustomDropDownButton({required this.options, Key? key})
//       : super(key: key);

//   @override
//   State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
// }

// class _CustomDropDownButtonState extends State<CustomDropDownButton> {
//   List<DropdownMenuItem> get _availablePorts =>
//       widget.options.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList();

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(
//                     elevation: 0,
//                     items: _availablePorts,
//                     style: const TextStyle(color: Color(0XFFF1F1F1)),
//                     dropdownColor: const Color(0xFF00396D),
//                     value: _availablePorts.isNotEmpty
//                         ? _selectedPort
//                         : "No Ports Available!",
//                     onChanged: (dynamic value) {
//                       setState(() {
//                         _selectedPort = value;
//                       });
//                     }),
//   }
// }
