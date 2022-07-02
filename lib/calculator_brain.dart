import 'dart:math';

 class CalculatorBrain{
   CalculatorBrain({this.height,this.weight});
   final int height;
   final int weight;
    double bmi=0;
   String CalulateBMI(){
     bmi = weight/ pow(height/100,2);
     return bmi.toStringAsFixed(1);
   }
   String getResult(){
     if(bmi>=25){
       return 'OVER WEIGHT';
     }else if(bmi> 18.5 && bmi<25){
       return 'NORMAL';
     }else return 'UNDER WEIGHT';
   }
   String getInterpretation(){
     if(bmi>=25){
       return 'You have higher than normal body weight. Try to Exercise more.';
     }else if(bmi> 18.5 && bmi <25){
       return 'you have normal body weight. Good Job!';
     }else return 'you have lower than normal body weight. You can eat a bit more.';
   }
 }