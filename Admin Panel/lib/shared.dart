import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  const Field({required this.hintText, required this.defText, required this.ctrl});
  final String hintText;
  final String defText;
  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide()),
        hintText: defText,
        helperText: hintText,
        helperStyle: TextStyle(fontSize: 15.0)
      ),
      controller: ctrl,
    );
  }
}

showNotification(context, message){

  SnackBar snackbar = SnackBar(content: Text(message), duration: Duration(seconds: 2), backgroundColor: Colors.green,);
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}