import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/button_cinco.dart';
import 'package:pomodoro_app/constructor_time.dart';

class ButtonPomodoroVinteCinco extends StatefulWidget {
  @override
  _ButtonPomodoroVinteCincoState createState() =>
      _ButtonPomodoroVinteCincoState();
}

class _ButtonPomodoroVinteCincoState extends State<ButtonPomodoroVinteCinco> {
  TimeSetting timeSetting = TimeSetting(
    '${25}',
    25,
    [
      Colors.blue[900],
      Colors.blue[800],
    ],
  );
  static int oneMinute = 60;

  Timer _timer;

  void MostrarCronometro() {
    setState(() {
      timeSetting.text = '${timeSetting.timeFinally - 1} : ${oneMinute}';
    });
  }

  void ReiniciarCronometro() {
    _timer.cancel();
    timeSetting.text = '${25}';
  }

  void ContagemRegressiva() {
    _timer = new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        oneMinute--;
        if (oneMinute >= 0) {
          MostrarCronometro();
        }
        if (oneMinute <= 0) {
          timeSetting.timeFinally--;
          oneMinute = 60;
          timer.runtimeType;
        }
        if (timeSetting.timeFinally <= 0) {
          timer.cancel();
        }
        if (timeSetting.timeFinally <= 0 && oneMinute >= 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ButtonPomodoroCinco(),
            ),
          );
        }
      },
    );
  }

  LinearGradient linearGradient(List<double> stops, List<Color> colors) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: stops,
      colors: colors,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: linearGradient(
            [0.3, 1, 1],
            [
              Colors.blue[600],
              Colors.blue[700],
              Colors.blue[800],
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: linearGradient(
                      [0.3, 1],
                      [
                        Colors.blue[700],
                        Colors.blue[600],
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white10),
                    color: Colors.black,
                  ),
                  width: 500,
                  height: 460,
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      CircleAvatar(
                        maxRadius: 120,
                        backgroundColor: timeSetting
                            .color[Random().nextInt(timeSetting.color.length)],
                        child: CircleAvatar(
                          maxRadius: 110,
                          backgroundColor: timeSetting.color[
                              Random().nextInt(timeSetting.color.length)],
                          child: CircleAvatar(
                              maxRadius: 100,
                              backgroundColor: Colors.black,
                              child: FlatButton(
                                child: Text(
                                  timeSetting.text,
                                  style: TextStyle(
                                      fontSize: 42, color: Colors.white),
                                ),
                                onPressed: () {
                                  ContagemRegressiva();
                                },
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: linearGradient(
                            [0.3, 1],
                            [
                              Colors.blue[700],
                              Colors.blue[600],
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white10),
                          color: Colors.black,
                        ),
                        child: FlatButton(
                          child: Icon(
                            Icons.stop_circle_outlined,
                            size: 60,
                            color: Colors.blue[900],
                          ),
                          onPressed: () {
                            setState(() {
                              ReiniciarCronometro();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: linearGradient(
                  [0.3, 1],
                  [
                    Colors.blue[700],
                    Colors.blue[600],
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white10),
                color: Colors.black,
              ),
              child: FlatButton(
                child: Icon(
                  Icons.keyboard_return,
                  color: Colors.blue[900],
                  size: 50,
                ),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ButtonPomodoroCinco(),
                      ),
                    );
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
