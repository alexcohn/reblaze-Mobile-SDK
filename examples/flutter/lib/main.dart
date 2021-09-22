import 'package:flutter/material.dart';

void main() {
  runApp(ReblazeExampleApp());
}

class ReblazeExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reblaze Example',
      // theme: ThemeData(
      //   primarySwatch: Colors.black,
      // ),
      home: ReblazeExamplePage(title: 'Reblaze Example Page'),
    );
  }
}

class ReblazeExamplePage extends StatefulWidget {
  ReblazeExamplePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ReblazeExamplePageState createState() => _ReblazeExamplePageState();
}

class _ReblazeExamplePageState extends State<ReblazeExamplePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
