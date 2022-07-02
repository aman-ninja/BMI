import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusasbleCard.dart';
import 'resuse_column.dart';
import 'result_page.dart';
import 'bottom_Button.dart';
import 'calculator_brain.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);
const containerColor = Color(0xFF111328);
const inContainColor = Color(0xFF1D1E33);
enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 150;
  int weight = 50;
  int age = 20;
  Color maleColor = inContainColor;
  Color femaleColor = inContainColor;
  void updateColor(Gender selectedgender){
    if(selectedgender==Gender.male){
      if(maleColor==inContainColor){
        maleColor = containerColor;
        femaleColor = inContainColor;
      }else{
        maleColor = inContainColor;
      }
    }
    if(selectedgender==Gender.female){
      if(femaleColor==inContainColor){
        femaleColor = containerColor;
        maleColor = inContainColor;
      }else{
        femaleColor = inContainColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1E39),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(

                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      updateColor(Gender.male);
                    });
                  },
                  child: reusasbleCard(colour: maleColor,
                  childCard: resuse_column(icon: FontAwesomeIcons.mars,text: 'MALE',
                  ),),
                ),),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateColor(Gender.female);
                  });
                },
                child: reusasbleCard(colour: femaleColor,
                  childCard: resuse_column(
                  icon: FontAwesomeIcons.venus,text: 'FEMALE',
                ),),
              )),
            ],
          )),
          Expanded(child:  reusasbleCard(colour: containerColor,
            childCard: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xFF8D8E98),
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'cm',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
          )
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child:  reusasbleCard(colour: containerColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                      Text(
                        weight.toString(),
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: (){
                              setState(() {
                                weight= weight+1;
                              });
                            },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.add,
                              )
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: (){
                              setState(() {
                                weight = weight-1;
                              });
                            },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.remove,
                              )
                          ),
                        ],
                      ),
                  ],
                ),)
                ),
                Expanded(child: reusasbleCard(colour: containerColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                    Text(
                      age.toString(),
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FloatingActionButton(
                          onPressed: (){
                            setState(() {
                              age = age+1;
                            });
                          },
                            backgroundColor: Color(0xFF4C4F5E),
                            child: Icon(
                              Icons.add,
                            )
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        FloatingActionButton(
                          onPressed: (){
                            setState(() {
                              age = age -1;
                            });
                          },
                            backgroundColor: Color(0xFF4C4F5E),
                            child: Icon(
                              Icons.remove,
                            )
                        ),
                      ],
                    ),
                  ],
                ),)
                ),
              ],
            ),
          ),
          BottomButton(ontap: (){
            CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Results(text: calc.CalulateBMI(),result:calc.getResult() ,interpretation: calc.getInterpretation());
            }));
          }, buttonTitle: 'CALCULATE',)
        ],
      ),
    );
  }
}



