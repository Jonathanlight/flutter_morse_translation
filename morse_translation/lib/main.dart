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
    messageTranslate = '';
  }

  String message;
  String messageTranslate;

  void _onClick(String value) {
    setState(() {
      message = message + value;
    });
  }

  void _decodeMorse(String message) {
    final Morse morse = new Morse();
    setState(() {
      messageTranslate = morse.decode(message);
      print(messageTranslate);
    });
  }

  void _encodeMorse(String message) {
    final Morse morse = new Morse();
    setState(() {
      messageTranslate = morse.encode(message);
      print(messageTranslate);
    });
  }

  void _cleanBoard() {
    setState(() {
      message = '';
      messageTranslate = '';
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
                              Text("Write")
                            ],
                          )
                      ),
                      new Padding( padding: EdgeInsets.only(top: 3.0)),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.blueAccent)
                        ),
                        child: new Text(
                          "$message",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      new Padding( padding: EdgeInsets.only(top: 3.0)),
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
                        child: new Text(
                          "$messageTranslate",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      new Padding( padding: EdgeInsets.only(top: 10.0)),
                      new Container(
                        child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FloatingActionButton(
                                mini: true,
                                onPressed: () => _onClick('.'),
                                child: Text('.'),
                              ),
                              FloatingActionButton(
                                mini: true,
                                onPressed: () => _onClick('-'),
                                child: Text('-'),
                              ),
                              FloatingActionButton(
                                mini: true,
                                onPressed: () => _onClick(' '),
                                tooltip: '1',
                                child: Text('[ ]'),
                              ),
                              FloatingActionButton(
                                onPressed: _cleanBoard,
                                child: Text('Clean'),
                              ),
                              FloatingActionButton(
                                backgroundColor: Colors.deepPurple,
                                onPressed: () => _decodeMorse(message),
                                child: Text('Valide'),
                              ),
                            ],
                          )
                      ),
                      new Padding( padding: EdgeInsets.only(top: 10.0)),
                      Divider(
                        height: 15.0,
                        color: Colors.blue,
                      ),
                      new Padding( padding: EdgeInsets.only(top: 10.0)),
                      new Container(
                        child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Wrap(
                                direction: Axis.horizontal,
                                spacing: 5.0,
                                children: <Widget>[
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('a'),
                                    child: Text('a'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('b'),
                                    child: Text('b'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('c'),
                                    child: Text('c'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('d'),
                                    child: Text('d'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('e'),
                                    child: Text('e'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('f'),
                                    child: Text('f'),
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                      new Container(
                        child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Wrap(
                                direction: Axis.horizontal,
                                spacing: 5.0,
                                children: <Widget>[
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('g'),
                                    child: Text('g'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('h'),
                                    child: Text('h'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('i'),
                                    child: Text('i'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('j'),
                                    child: Text('j'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('k'),
                                    child: Text('k'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('l'),
                                    child: Text('l'),
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                      new Container(
                        child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Wrap(
                                direction: Axis.horizontal,
                                spacing: 5.0,
                                children: <Widget>[
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('m'),
                                    child: Text('m'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('n'),
                                    child: Text('n'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('o'),
                                    child: Text('o'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('p'),
                                    child: Text('p'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('q'),
                                    child: Text('q'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('r'),
                                    child: Text('r'),
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                      new Container(
                        child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Wrap(
                                direction: Axis.horizontal,
                                spacing: 5.0,
                                children: <Widget>[
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('s'),
                                    child: Text('s'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('t'),
                                    child: Text('t'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('u'),
                                    child: Text('u'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('v'),
                                    child: Text('v'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('w'),
                                    child: Text('w'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('x'),
                                    child: Text('x'),
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                      new Container(
                        child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Wrap(
                                direction: Axis.horizontal,
                                spacing: 5.0,
                                children: <Widget>[
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('y'),
                                    child: Text('y'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick('z'),
                                    child: Text('z'),
                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    onPressed: () => _onClick(' '),
                                    child: Text('[ ]'),
                                  ),
                                  FloatingActionButton(
                                    mini: false,
                                    backgroundColor: Colors.green,
                                    onPressed: () => _encodeMorse(message),
                                    child: Text('Valide'),
                                  ),
                                ],
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


    