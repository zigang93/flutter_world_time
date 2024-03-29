import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {

  String location; // location for the UI
  String time; // the time in that location
  String flag; // the country assets icon
  String url; // location url for api endpoint
  bool isDaytime; // true or false if daytime or not

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {

    try {
      // make the request
      Response res = await get('http://worldtimeapi.org/api/timezone/$url');

      Map data = json.decode(res.body);
      //print(data);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print('$offset');

      // create DateTime Object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset) ));
      // print(now);

      // set time to property, format wth intl
      time = DateFormat.jm().format(now);
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    } 
    catch (e) {
      print('Caught error: $e');
      time = 'Could not get time date';
    }

    

  }

}
