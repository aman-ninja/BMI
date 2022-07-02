import 'package:flutter/material.dart';
import 'input_page.dart';
class BottomButton extends StatelessWidget {
  BottomButton({@required this.ontap,@required this.buttonTitle});
  final Function ontap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
            child: Text(buttonTitle,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),)),
        color: bottomContainerColor ,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}