import 'package:flutter/material.dart';
import 'package:flutter_morse/flutter_morse.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Morse Translator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Morse Translator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    message = '';
    decodedMessage = '';
  }

  String message;
  String decodedMessage;

  void _onClick(String value) {
    setState(() {
      message = message + value;
    });
  }

  void _decodeMorse(String encodedMessage) {
    final Morse morse = new Morse();
    setState(() {
      decodedMessage = morse.decode(encodedMessage);
      print(decodedMessage);
    });
  }

  void _cleanBoard() {
    setState(() {
      print('clean');
      message = '';
      decodedMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: new Container(
              color: Colors.transparent,
              margin: EdgeInsets.all(30),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Morse")
                            ],
                          )
                      ),
                      new Padding( padding: EdgeInsets.only(top: 5.0)),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.blueAccent)
                        ),
                        child: new Text("$message"),
                      ),
                      new Padding( padding: EdgeInsets.only(top: 50.0)),
                      new Container(
                        child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Translation")
                            ],
                          )
                      ),
                      new Padding( padding: EdgeInsets.only(top: 5.0)),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.blueAccent)
                        ),
                        child: new Text("$decodedMessage"),
                      ),
                      new Padding( padding: EdgeInsets.only(top: 100.0)),
                      new Container(
                        child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () => _onClick('.'),
                                child: Text('.'),
                              ),
                              FloatingActionButton(
                                onPressed: () => _onClick('-'),
                                child: Text('-'),
                              ),
                              FloatingActionButton(
                                onPressed: () => _onClick(' '),
                                tooltip: '1',
                                child: Text('[space]'),
                              ),
                              FloatingActionButton(
                                onPressed: _cleanBoard,
                                child: Text('Clean'),
                              ),
                            ],
                          )
                      ),
                       new Padding( padding: EdgeInsets.only(top: 20.0)),
                      new Container(
                        child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new RaisedButton(
                                child: const Text('Launch'),
                                color: Theme.of(context).accentColor,
                                elevation: 4.0,
                                splashColor: Colors.blueGrey,
                                onPressed: () => _decodeMorse(message),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}


    