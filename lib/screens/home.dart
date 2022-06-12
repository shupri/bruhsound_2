import 'package:bmi/constants/app_constants.dart';
import 'package:bmi/widgets/left_bar.dart';
import 'package:bmi/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Penghitung Indeks Masa Badan",
            style: TextStyle(color: Colors.lightGreen, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300, color: Colors.lightGreen),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Tinggi",
                        hintStyle: TextStyle(fontSize: 45, fontWeight: FontWeight.w300, color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: TextField(
                      controller: _weightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300, color: Colors.lightGreen),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Berat",
                        hintStyle: TextStyle(fontSize: 45, fontWeight: FontWeight.w300, color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = _w / (_h * _h);
                    if (_bmiResult > 25) {
                      _textResult = "ANTUM GENDUD";
                    } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                      _textResult = "BERAT NORMAL";
                    } else {
                      _textResult = "KAMU KURANG MANGAN";
                    }
                  });
                },
                child: Container(
                  child: Text(
                    "Hitung",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  _bmiResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 90, color: Colors.green),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                  visible: _textResult.isNotEmpty,
                  child: Container(
                    child: Text(
                      _textResult,
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: Colors.green),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              LeftBar(
                barWidth: 40,
              ),
              SizedBox(
                height: 20,
              ),
              LeftBar(barWidth: 70),
              SizedBox(
                height: 20,
              ),
              LeftBar(
                barWidth: 40,
              ),
              SizedBox(
                height: 20,
              ),
              RightBar(barWidth: 70),
              SizedBox(
                height: 50,
              ),
              RightBar(barWidth: 70),
            ],
          ),
        ));
  }
}
