import 'package:flutter/material.dart';
import 'package:pomodoro_timer/website/mainScreen_Website.dart';

void main(){
  runApp(MyApp()) ;
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: MainScreenWebsite(),
    );
  }

}