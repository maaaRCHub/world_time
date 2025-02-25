import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
Map<String, dynamic> data = {};

@override
Widget build(BuildContext context) {
  final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
  data = routeArgs ?? {'location': 'Unknown', 'time': 'Unavailable'};

  return Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
        child: Column(
          children: <Widget>[
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              icon: Icon(Icons.edit_location),
              label: Text('Edit Location'),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              data['time'],
              style: const TextStyle(
                fontSize: 66.0,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}