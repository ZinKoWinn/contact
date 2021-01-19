import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String prefix;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType textInputType;
  final Validator validator;

  const MyTextField({
    Key key,
    @required this.label,
    @required this.hint,
    @required this.prefix,
    @required this.icon,
    @required this.controller,
    this.textInputType = TextInputType.text,
    @required this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: textInputType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          prefix: Text(prefix != null ? prefix : ""),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}

typedef Validator = String Function(String);
