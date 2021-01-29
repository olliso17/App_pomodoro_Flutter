import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/button_vinte_cinco.dart';
import 'package:pomodoro_app/constructor_time.dart';

class ButtonPomodoroCinco extends StatefulWidget {
  @override
  _ButtonPomodoroCincoState createState() => _ButtonPomodoroCincoState();
}

class _ButtonPomodoroCincoState extends State<ButtonPomodoroCinco> {
  //construtor
  TimeSetting timeSetting = TimeSetting(
    '${5}',
    5,
    [
      Colors.green[900],
      Colors.green[800],
    ],
  );
  static int oneMinute = 60;

  Timer _timer;
//função que mostra o cronômetro regredindo
  @override
  void mostrarCronometro() {
    setState(() {
      timeSetting.text = '${timeSetting.timeFinally - 1} : ${oneMinute}';
    });
  }

//função do botão de stop, que reinicia o cronômetro
  @override
  void reiniciarCronometro() {
    _timer.cancel();
    timeSetting.text = '${5}';
  }

//função que inicia o cronometro
  @override
  void contagemRegressiva() {
    _timer = new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        oneMinute--;
        if (oneMinute >= 0) {
          mostrarCronometro();
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
          //   AndroidAlarmManager.periodic(
          //       Duration(seconds: 10), timeSetting.timeFinally, () {
          //     AndroidAlarmManager.initialize();
          //   });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ButtonPomodoroVinteCinco(),
            ),
          );
        }
      },
    );
  }

//mesmas configurações do linearGradient nos containers
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
            Colors.green[900],
            Colors.green[800],
            Colors.green[700],
          ],
        )),
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
                        Colors.green[800],
                        Colors.green[900],
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
                      //widgets que envolvem o cronômetro em forma circular
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
                              //botão do cronômetro
                              child: FlatButton(
                                child: Text(
                                  timeSetting.text,
                                  style: TextStyle(
                                      fontSize: 42, color: Colors.white),
                                ),
                                onPressed: () {
                                  // playSound();
                                  contagemRegressiva();
                                },
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      //botão para reiniciar a contagem
                      Container(
                        decoration: BoxDecoration(
                          gradient: linearGradient(
                            [0.3, 1],
                            [
                              Colors.green[800],
                              Colors.green[900],
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
                            color: Colors.green[900],
                          ),
                          onPressed: () {
                            setState(() {
                              // alarmPlay();
                              reiniciarCronometro();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //botão de retornar
            Container(
              decoration: BoxDecoration(
                gradient: linearGradient(
                  [0.3, 1],
                  [
                    Colors.green[800],
                    Colors.green[900],
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white10),
                color: Colors.black,
              ),
              child: FlatButton(
                child: Icon(
                  Icons.keyboard_return,
                  color: Colors.green[900],
                  size: 50,
                ),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ButtonPomodoroVinteCinco(),
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
