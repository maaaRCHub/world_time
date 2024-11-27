import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location;
  String time = 'unavailable';
  String? flag;
  String? url; // E.g., "Europe/London"
  WorldTime({this.location, this.flag, this.url});
  Future<void> getTime() async {
    try {
      final response = await get(Uri.parse(
          'https://worldtimeapi.org/api/timezone/Europe/Berlin'));
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);

        // Parse the datetime
        String datetime = data['datetime'];
        DateTime now = DateTime.parse(datetime);

        // Format the time
        time = DateFormat.jm().format(now);
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }


}
