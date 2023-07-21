import 'package:bmi_calculator/bmi_screen.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key});


  String getResult(bmi){
    if(bmi<18.5){
      return("UNDERWEIGHT");
    }
    else if(bmi>=18.5 && bmi<=24.9){
      return("NORMAL");
    }
    else if(bmi>=25.0 && bmi<=29.9){
      return("OVERWEIGHT");
    }
    else{
      return("OBESE");
    }
  }

  String getRepresentation(bmi){
    if(bmi<18.5){
      return("You have lower than normal body weight. You can eat a bit more.");
    }
    else if(bmi>=18.5 && bmi<=24.9){
      return("You have a normal body weight. Good job!");
    }
    else if(bmi>=25.0 && bmi<=29.9){
      return("You have higher than normal body weight. try to exercise more.");
    }
    else{
      return("You have higher than normal body weight. try to exercise more.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child:const Text("Your Result",
                    style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.left,),
            ),
              Container(
                height: 550,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Text>[
                  Text(getResult(bmi),
                  style: TextStyle(
                    color: getResult(bmi) == "NORMAL" ? Colors.green : Colors.red,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text(bmi.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 100,fontWeight: FontWeight.bold),),
                  Text(getRepresentation(bmi),
                  style: const TextStyle(fontSize: 22),),
                ],
              ),
            ),
            Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: const Color(0xFFEB1555),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 80,
                  child: const Text("RE-CALCULATE",
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}