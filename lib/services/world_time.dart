import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location; // location for the UI
  String time; // the time in that location
  String flag; // the country assets icon
  String url; // location url for api endpoint

  WorldTime({ this.location, this.flag, this.url});

  Future<void> getTime() async {
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

    // set time to property
    time = now.toString();

  }

}
