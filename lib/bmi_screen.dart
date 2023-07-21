import 'dart:math';

import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

// the BMI result
late double bmi;
// this is the function that will calculate the BMI ====   weight/height^2
class _BmiCalculatorState extends State<BmiCalculator> {
  double cm = 160;
  int age = 20;
  int weight = 60;
  String gender = "";
  calculateBMI(){
    bmi = weight/pow(cm/100, 2); 
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // the app bar with the title
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        backgroundColor: const Color(0xFF0A0E21),
        elevation: 5,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <SizedBox>[
                  SizedBox(
                    width: MediaQuery. of(context). size. width*0.43,
                    height: 155,
                      child: MaterialButton(
                        elevation: 0,
                      onPressed:(){
                        setState(() {
                          gender = "male";
                        });
                      },
                      color: gender == "male"? const Color(0xFF1D1E33) : const Color(0xFF111328),
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: const Column(
                        children: [
                          Icon(Icons.male,size: 80,),
                          Text("MALE",style: TextStyle(fontSize: 18,color: Color(0xFF8D8E98),)),
                        ],
                      ),
                    ),
                  ),
  
                  SizedBox(
                    width: MediaQuery. of(context). size. width*0.43,
                    height: 155,
                    child: MaterialButton(
                      elevation: 0,
                      onPressed:(){
                        setState(() {
                          gender = "female";
                        });
                      },
                      color: gender == "female"? const Color(0xFF1D1E33) : const Color(0xFF111328),
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: const Column(
                        children: [
                          Icon(Icons.female,size: 80,),
                          Text("FEMALE",style: TextStyle(fontSize: 18,color: Color(0xFF8D8E98)),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFF1D1E33),
                  
                ),
                child: Column(
                  children: <Widget>[
                    const Text("HEGHT",
                    style: TextStyle(fontSize: 18,color: Color(0xFF8D8E98)),),
                    
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 30)
                      ),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(cm.toInt().toString(),
                        style: const TextStyle(fontSize: 50,fontWeight: FontWeight.w900,),),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 22, 0, 0),
                          child: Text("cm",
                        style: TextStyle(fontSize: 18,),),
                          ),
                      ],
                    ),
                    ),
                    Slider(
                      value: cm,
                      min: 120,
                      max: 220,
                      inactiveColor: const Color(0xFF8D8E98),
                      activeColor: Colors.white,
                      thumbColor: const Color(0xFFEB1555),
                      onChanged: (cm)=> setState(() {
                        this.cm = cm;
                        }),  
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <SizedBox>[
                  SizedBox(
                    width: MediaQuery. of(context). size. width*0.43,
                    height: 200,
                    
                      child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xFF1D1E33),
                      ),
                      child: Column(
                        children: [
                          const Text("WEIGHT",
                          style: TextStyle(fontSize: 18,color: Color(0xFF8D8E98)),),
                          Text(weight.toString(),
                          style: const TextStyle(fontSize: 50,fontWeight: FontWeight.w900),),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <MaterialButton>[
                                MaterialButton(
                                  onPressed: (){
                                    if(weight!=0){
                                      setState(() {
                                        weight--;
                                      });
                                    }
                                  },
                                  height: 56,
                                  minWidth: 56,
                                  color: const Color(0xFF4C4F5E),
                                  shape: const CircleBorder(),
                                  child: const Icon(Icons.remove),
                                ),
                                MaterialButton(
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  height: 56,
                                  minWidth: 56,
                                  color: const Color(0xFF4C4F5E),
                                  shape: const CircleBorder(),
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery. of(context). size. width*0.43,
                    height: 200,
                      child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xFF1D1E33)
                      ),
                      child: Column(
                        children: [
                          const Text("AGE",
                          style: TextStyle(fontSize: 18,color: Color(0xFF8D8E98)),),
                          Text(age.toString(),
                          style: const TextStyle(fontSize: 50,fontWeight: FontWeight.w900),),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <MaterialButton>[
                                MaterialButton(
                                  onPressed: (){
                                    if(age!=0){
                                      setState(() {
                                        age--;
                                    });
                                    }
                                  },
                                  height: 56,
                                  minWidth: 56,
                                  color: const Color(0xFF4C4F5E),
                                  shape: const CircleBorder(),
                                  child: const Icon(Icons.remove),
                                ),
                                MaterialButton(
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  height: 56,
                                  minWidth: 56,
                                  color: const Color(0xFF4C4F5E),
                                  shape: const CircleBorder(),
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                // alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: const Color(0xFFEB1555),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 80,
                  child: const Text("CALCULATE",
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                  onPressed: (){
                    calculateBMI();
                    Navigator.push(
                      context,
                       MaterialPageRoute(builder: (context)=>const Result()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}