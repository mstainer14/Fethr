import 'package:fethr/statics/colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color colour;
  final Color textColour;
  final Key key;
  const RoundButton({
    this.key,
    this.text,
    this.onPressed,
    this.colour = primaryBlack,
    this.textColour = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: MaterialButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: colour,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: textColour),
          ),
        ),
      ),
    );
  }
}

class RoundOutlineButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final colour;
  final Color textColour;
  const RoundOutlineButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.colour = primaryBlack,
    this.textColour = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29),
            side: BorderSide(color: colour, width: 2, style: BorderStyle.solid),
          ),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: textColour),
          ),
        ),
      ),
    );
  }
}
