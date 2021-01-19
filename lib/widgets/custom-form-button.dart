import 'package:flutter/material.dart';

import 'custom-button.dart';

class FormButton extends CustomButton {
  FormButton({
    @required String label,
    @required VoidCallback onPressed,
    double width,
  }) : super(
          color: Colors.blue,
          child: Text(label),
          textColor: Colors.white,
          onPressed: onPressed,
          height: 40.0,
          width: width,
        );
}
