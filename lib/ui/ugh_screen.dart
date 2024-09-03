import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/hoaxes');
                  },
                  style: ButtonStyle(
                    elevation: WidgetStatePropertyAll(
                      5.0,
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 157, 209, 236),
                    ),
                  ),
                  child: Text(
                    'Hoaxes',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/news');
                  },
                  style: ButtonStyle(
                    elevation: WidgetStatePropertyAll(
                      5.0,
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 157, 209, 236),
                    ),
                  ),
                  child: Text(
                    'News',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 16.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/hospitals');
                  },
                  style: ButtonStyle(
                    elevation: WidgetStatePropertyAll(
                      5.0,
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 157, 209, 236),
                    ),
                  ),
                  child: Text(
                    'Hospitals',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/stats');
                  },
                  style: ButtonStyle(
                    elevation: WidgetStatePropertyAll(
                      5.0,
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 157, 209, 236),
                    ),
                  ),
                  child: Text(
                    'Stats',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
