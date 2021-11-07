import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

import 'package:flutter/services.dart';
import 'package:reblaze/reblaze.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _rbzSdk = 'Unknown';
  Future<String>? _futureResponse;
  int _counter = 0;
  static const String _token = 'Bearer cn389ncoiwuencr';

  @override
  void initState() {
    super.initState();
    initHash();
    initReblazeSdk();
    reblaze.getBackendUrl().then( (backendUrl) => print('BackendUrl: $backendUrl') );
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initHash() async {
    String rbzSdk;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      rbzSdk = await reblaze.generateHash();
    } on PlatformException {
      rbzSdk = 'Failed to generate hash.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _rbzSdk = rbzSdk;
      _futureResponse = fetch();
    });
  }

  Future<void> initReblazeSdk() async {
    reblaze.setInterval(20);
    reblaze.setToken(_token);
    reblaze.setTimeslice(500);
    reblaze.enableMock();
    reblaze.setMockResponse(200, '{"name":"mock", "interval":12}');
    reblaze.setBackendUrl('https://example.com');
  }

  Future<void> onPlusButtonPressed() async {
    reblaze.sendEvent('+button');
    _counter++;
    _futureResponse = fetch();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Reblaze Flutter example app'),
        ),
        body: Center(
          child: Padding(padding: EdgeInsets.all(10),
            child: Column (
              children: [
                Text('${reblaze.reblazeHeader}: $_rbzSdk\n'),
                FutureBuilder<String>(
                  future: _futureResponse,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!);
                    }
                    return const CircularProgressIndicator();
                  },
                ),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: onPlusButtonPressed,
          tooltip: 'post',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  final client = http.Client();

  Future<String> fetch() async {
    final path = _counter > 0 ? _counter : "init";
    final response = await client.get(Uri.parse('${await reblaze.getBackendUrl()}/flutter/$path'),
        headers: {
          HttpHeaders.authorizationHeader: _token,              // must be same as reblaze.getToken()
          reblaze.reblazeHeader: await reblaze.generateHash(),  // must be generated for every request
        }
    );
    if (response.statusCode == 200) {
      final html_doc = parse(response.body);
      return html_doc.body!.innerHtml;
    } else {
      return '${response.statusCode}: ${response.body}';
    }
  }
}
