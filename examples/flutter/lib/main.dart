import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

void main() {
  runApp(ReblazeExampleApp());
}

Future<String> fetch(String path) async {
  final response = await http.get(Uri.parse('https://fire-gcp-lb.rbzdevsdk001.dev.rbzdns.com/flutter/$path'),
      headers: {
        'rbzid': 'test',
      }
  );
  if (response.statusCode == 200) {
    final html_doc = parse(response.body);
    assert (html_doc.getElementsByTagName('h3')[0].innerHtml == 'Request headers');
    final headers = html_doc.getElementsByTagName('pre')[0].innerHtml.split('\n');
    return headers.firstWhere(
          (header) => header.startsWith('HTTP_RBZID'),
          orElse: () => 'QQ_RBZID => nil',
        )
        .split('_')[1]
        .replaceFirst('&gt;', '>') + ' [$path]';
  } else {
    return '${response.statusCode}: ${response.body}';
  }
}

class ReblazeExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reblaze Example',
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
  Future<String> futureResponse;

  @override
  void initState() {
    super.initState();
    futureResponse = fetch('init');
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      futureResponse = fetch(_counter.toString());
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
              'Request updates:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FutureBuilder<String>(
              future: futureResponse,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data);
                }
                return const CircularProgressIndicator();
              },
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
