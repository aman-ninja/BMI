import 'package:flutter/material.dart';

class resuse_column extends StatelessWidget {
  resuse_column({@required this.icon,@required this.text}) ;

  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
            text,
            style: TextStyle (
              fontSize: 18.0,
              color: Color(0xFF8D8E98),
            )
        )
      ],
    );
  }
}

