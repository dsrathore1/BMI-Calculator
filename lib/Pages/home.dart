import 'package:bmi_calculator/Pages/Right.dart';
import 'package:bmi_calculator/Pages/Left.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _result = 0;
  String _answer = "";

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 22,
            color: Colors.amberAccent,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 170,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontSize: 30,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Height",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 30),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.amberAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 170,
                  child: TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontSize: 30,
                    ),
                    decoration: InputDecoration(
                      hintText: "Weight",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 30),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.amberAccent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              child: Container(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 30,
                  ),
                ),
              ),
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _result = _w / (_h * _h);
                  if (_result > 25) {
                    _answer = "You're over weight";
                  } else if (_result >= 18.5 && _result <= 25) {
                    _answer = "You're normal weight";
                  } else {
                    _answer = "You're under weight";
                  }
                });
              },
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     double _h = double.parse(_heightController.text);
            //     double _w = double.parse(_weightController.text);
            //     setState(() {
            //       _result = _w / (_h * _h);
            //       if (_result > 25) {
            //         _answer = "You're over weight";
            //       } else if (_result >= 18.5 && _result <= 25) {
            //         _answer = "You're normal weight";
            //       } else {
            //         _answer = "You're under weight";
            //       }
            //     });
            //   },
            //   style: ElevatedButton.styleFrom(
            //     padding: EdgeInsets.symmetric(
            //       vertical: 11,
            //       horizontal: 60,
            //     ),
            //   ),
            //   child: Text(
            //     "Calculate",
            //     style: TextStyle(
            //       fontSize: 25,
            //       color: Colors.black87,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                _result.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.amberAccent,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _answer.isNotEmpty,
              child: Container(
                  child: Text(
                _answer,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.amberAccent,
                ),
              )),
            ),
            SizedBox(
              height: 120,
            ),
            LeftBar(barWidth: 60),
            SizedBox(
              height: 10,
            ),
            LeftBar(barWidth: 90),
            SizedBox(
              height: 10,
            ),
            LeftBar(barWidth: 60),
            RightBar(barWidth: 120),
            SizedBox(
              height: 20,
            ),
            RightBar(barWidth: 120)
          ],
        ),
      ),
    );
  }
}
