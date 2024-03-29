import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _minutes = 0;
  int _seconds = 0;
  bool _isTimerRunning = false;

  void startTimer() {
    setState(() {
      _isTimerRunning = true;
    });

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        if (_minutes == 0) {
          timer.cancel();
          setState(() {
            _isTimerRunning = false;
          });
        } else {
          setState(() {
            _minutes--;
            _seconds = 59;
          });
        }
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  void stopTimer() {
    setState(() {
      _isTimerRunning = false;
    });
  }

  void resetTimer() {
    setState(() {
      _minutes = 0;
      _seconds = 0;
      _isTimerRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Nama: '),
                Text('Muhamad Abila Nurrodin'),
              ],
            ),
            Row(
              children: <Widget>[
                Text('NIM: '),
                Text('222410102083'),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: <Widget>[
                Text('Durasi: '),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Masukkan durasi (menit)',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _minutes = int.parse(value);
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _isTimerRunning ? null : startTimer,
                  child: Text('Mulai'),
                ),
                ElevatedButton(
                  onPressed: _isTimerRunning ? stopTimer : null,
                  child: Text('Berhenti'),
                ),
                ElevatedButton(
                  onPressed: resetTimer,
                  child: Text('Mulai Ulang'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              '$_minutes : $_seconds',
              style: TextStyle(fontSize: 48),
            ),
          ],
        ),
      ),
    );
  }
}
