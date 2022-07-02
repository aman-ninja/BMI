import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'reusasbleCard.dart';
import 'bottom_Button.dart';

class Results extends StatelessWidget {
  Results({this.result,this.text,this.interpretation});
  final String result;
  final String text;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Results',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
          ),
          Expanded(
            flex: 5,
            child: reusasbleCard(
              colour: Color(0xFF111328),
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                   Text(
                      result.toUpperCase(),
                      style: TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 100.0,
                  ),
                  ),
                  Text(interpretation, style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),),
                  BottomButton(
                    ontap: (){
                      Navigator.pop(context);
                    },buttonTitle: 'RE-CALCULATE',
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
