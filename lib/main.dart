import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<String>? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getName(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError){
                print('error');
              }else if(snapshot.hasData){
                return Text(snapshot.data as String);
              }

            }

            return const SpinKitRotatingCircle(
              color: Colors.white,
              size: 50.0,
            );
          },
        ),
      ),
    );
  }

  Future<String> getName() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'kelvin';
  }
}
