import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key key, this.text, this.press, this.submitted})
      : super(key: key);

  final String text;
  final Function press;
  final submitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 40,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.red[900],
        disabledColor: Colors.grey[400],
        disabledTextColor: Colors.white60,
        onPressed: press,
        child: submitted
            ? SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Lato-Regular.ttf',
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
