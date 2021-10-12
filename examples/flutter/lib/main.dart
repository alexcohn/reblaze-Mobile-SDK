import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

import 'reblaze.dart';

void main() {
  runApp(ReblazeExampleApp());
}

final client = http.Client();

Future<String> fetch(String path) async {
  final response = await client.get('${await reblaze.getBackendUrl()}/flutter/$path',
      headers: {
        HttpHeaders.acceptHeader: "text/html",                     // to get ISHUMAN header back from our echo server
        HttpHeaders.authorizationHeader: "alex",                   // must be same as reblaze.getToken()
        HttpHeaders.userAgentHeader: await reblaze.getUserAgent(), // better keep it same as the UA that the SDK sends
        reblaze.reblazeHeader: await reblaze.generateHash(),       // must be generated for every request
      }
  );
  if (response.statusCode == 200) {
    final html_doc = parse(response.body);
    final h3 = html_doc.getElementsByTagName('h3');
    if (h3 != null && h3.isNotEmpty && h3[0].innerHtml == 'Request headers') {
      final headers = html_doc.getElementsByTagName('pre')[0].innerHtml.split(
          '\n');
      return headers.firstWhere(
            (header) => header.startsWith('HTTP_ISHUMAN'),
        orElse: () => 'HTTP_ISHUMAN =&gt; ### FALSE ###',
      )
          .split('_')[1]
          .replaceFirst('&gt;', '>') + ' [$path]';
    }
    else {
      final headers = html_doc.body.innerHtml.split('\n');
      return headers.firstWhere((header) => header.startsWith('Ishuman:'),
          orElse: () => 'ishuman: ### FALSE ###',
      );
    }
  } else {
    return '${response.statusCode}: ${response.body}';
  }
}

class ReblazeExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    reblaze.setInterval(30);
    reblaze.setToken('alex');
    reblaze.setTimeslice(1000);
    reblaze.setBackendUrl('https://fire-gcp-lb.rbzdevsdk001.dev.rbzdns.com');
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
    reblaze.getBackendUrl().then( (backendUrl) => print('BackendUrl: $backendUrl') );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      futureResponse = fetch(_counter.toString());
      reblaze.sendEvent('counter');
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'type here',
                  border: OutlineInputBorder(),
                ),
              ),

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
