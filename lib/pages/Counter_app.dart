import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter_app extends StatefulWidget {
  const Counter_app({Key? key}) : super(key: key);

  @override
  State<Counter_app> createState() => _Counter_appState();
}

class _Counter_appState extends State<Counter_app> {
  final _random = Random.secure();
  int _score = 0, _heighestScore = 0, _sum = 0, _index1 = 0, _index2 = 0;
  bool _isGameOver=false;

  final _diceList = [
    'pictures/d1.png',
    'pictures/d2.png',
    'pictures/d3.png',
    'pictures/d4.png',
    'pictures/d5.png',
    'pictures/d6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score: $_score',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Highest Score: $_heighestScore',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  _diceList[_index1],
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  _diceList[_index2],
                  width: 100,
                  height: 100,
                )
              ],
            ),
            Text(
              'Dice sum: $_sum',
              style: TextStyle(fontSize: 20),
            ),
            if(_isGameOver==true)const Text(
              'Game is over!',
              style: TextStyle(fontSize: 30,color: Colors.red),
            ),
            if(!_isGameOver)ElevatedButton(
              child: Text("Roll"),
              onPressed: _rollTheDice,
            ),
            if(_isGameOver==true)ElevatedButton(
              child: Text("Reset "),
              onPressed: _reset,
            )
          ],
        ),
      ),
    );
  }

  void _rollTheDice() {

    setState(() {
      _index1 = _random.nextInt(6);
      _index2 = _random.nextInt(6);
    });


     setState(() {
       _sum = (_index1+1) + (_index2+1) ;
       _score = _score+_sum;
     });

       if(_sum == 11)
       {
         setState(() {
           _heighestScore = _score;
           _isGameOver = true;
         });
       }

  }

  void _reset() {
    setState(() {
      _score =0;
      _index1=0;
      _index2=0;
      _sum =0;
      _isGameOver =false;
    });
  }
}
