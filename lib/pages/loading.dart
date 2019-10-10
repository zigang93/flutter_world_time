import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Kuala Lumpur', flag: 'malaysia.png', url: 'Asia/Kuala_Lumpur');
    await instance.getTime();
    // print(instance.time);
    // setState(() {
    //   time = instance.time; 
    // });
    // not stack navigation
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child:  SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      )
    );
  }
}