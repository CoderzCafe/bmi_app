

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {

  double bmi = 0.0;
  String formattedText = "";
  TextEditingController _ageController = new TextEditingController();
  var _heightController = new TextEditingController();
  var _weightController = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;

//  BMI Categories:
//  Underweight = <18.5
//  Normal weight = 18.5–24.9
//  Overweight = 25–29.9
//  Obesity = BMI of 30 or greater
//  ((weight * 703)/(height * height));



  void calculateBMI() {
    /** my logic **/
//  setState(() {
//        if(_ageController.text.isNotEmpty && height > 0.0 && weight > 0.0) {
//      height = height*0.3048;
//      bmi = (((weight*2.204623) * 703) / (pow((height), 2)));
//
//      if(bmi <= 18.5) {
//        formattedText = "Your BMI is ${bmi.toStringAsFixed(2)} \n UNDER WEIGHT";
//      } else if(bmi >= 18.5 && bmi <= 24.9) {
//        formattedText = "Your BMI is ${bmi.toStringAsFixed(2)} \n NORMAL WEIGHT";
//      } else if(bmi >= 25 && bmi <= 29.9) {
//        formattedText = "Your BMI is ${bmi.toStringAsFixed(2)} \n OVER WEIGHT";
//      } else if(bmi >= 30) {
//        formattedText = "Your BMI is ${bmi.toStringAsFixed(2)} \n OBESITY";
//      } else {
//        formattedText = "Wrong";
//      }
//    }
//  });

    /** there logic **/
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height * 12;
      double weight = double.parse(_weightController.text);

      if((_ageController.text.isNotEmpty || age > 0)
          && (_heightController.text.isNotEmpty || height > 0.0)
          && (_weightController.text.isNotEmpty || weight > 0.0)) {

        result = (weight*2.204623) / (inches * inches) * 703;  // BMI
        /***  BMI Categories:
            Underweight = <18.5
            Normal weight = 18.5–24.9
            Overweight = 25–29.9
            Obesity = BMI of 30 or greater
            ((weight * 703)/(height * height));
            check BMI  ***/
        if(result <= 18.6) {
          formattedText = "You are Under weight \n BMI is ${result.toStringAsFixed(2)}";
        } else if(result >= 18.6 && result <= 24.9) {
          formattedText = "You are Normal weight \n BMI is ${result.toStringAsFixed(2)}";
        } else if(result >= 25 && result <= 29.9) {
          formattedText = "You are Normal weight \n BMI is ${result.toStringAsFixed(2)}";
        } else if(result >= 30) {
          formattedText = "You are Normal weight \n BMI is ${result.toStringAsFixed(2)}";
        } else {
          formattedText = "Something is wrong";
        }

      }

    });
  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

      appBar: new AppBar(
        backgroundColor: Colors.redAccent,
        title: new Text("BMI", textDirection: TextDirection.ltr,
          style: new TextStyle(fontSize: 20, color: Colors.white70,
              fontWeight: FontWeight.w600),),
      ),

      body: new Container(
        alignment: Alignment.topCenter,
        child: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[

              new Padding(padding: const EdgeInsets.all(2.0)),

              new Image.asset(
                "assets/images/bmilogo.png",
                width: 200,
                height: 133.3,
              ),

              const Padding(padding: const EdgeInsets.all(10.0)),

              new Container(
//                margin: const EdgeInsets.only(),
                child: new Column(
                  children: <Widget>[

                    new TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: "Age",
                        hintText: "Age",
                        icon: new Icon(Icons.person),
                      ),
                    ),

                    const Padding(padding: const EdgeInsets.all(5.5)),

                    new TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: "Height in feet",
                        hintText: "Height in feet",
                        icon: new Icon(Icons.view_agenda),
                      ),
                    ),

                    const Padding(padding: const EdgeInsets.all(5.5)),

                    new TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: "Weight in lb",
                        hintText: "Weight in lb",
                        icon: new Icon(Icons.line_weight),
                      ),
                    ),

                    const Padding(padding: const EdgeInsets.all(5.5)),

                    new RaisedButton.icon(
                      onPressed: calculateBMI,
                      label: new Text("CALCULATE", textDirection: TextDirection.ltr,
                        style: new TextStyle(fontSize: 20, fontWeight: FontWeight.w500,
                            color: Colors.white70),
                      ),
                      icon: new Icon(Icons.local_cafe, color: Colors.white70),
                      color: Colors.deepPurpleAccent,
                    ),
                  ],
                ),
              ),

              const Padding(padding: const EdgeInsets.all(10.5)),

              new Container(
                child: new Center(
                  child: new Text(formattedText, textDirection: TextDirection.ltr,
                    style: new TextStyle(color: Colors.redAccent,
                      fontSize: 25, fontWeight: FontWeight.w500,
                    ),),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }

}