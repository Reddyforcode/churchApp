import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

void main(){
  runApp(new MaterialApp(
    home: new HomePage(),
    routes: <String, WidgetBuilder>{
      "/Home": (BuildContext context) => HomePage(),
      "/SecondPage": (BuildContext context) => SecondPage(),    
      "/radio": (BuildContext context) => WebviewDemo()  
      }
  ));
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: Text("Home"), backgroundColor: Colors.deepOrange),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.favorite, color: Colors.redAccent),
                iconSize: 70.0,
                onPressed: () {Navigator.of(context).pushNamed("/SecondPage");},
              ),
              new Text("Home")
            ]
          )
        )
      )
    );
  }
}



class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: Text("Second Page"), backgroundColor: Colors.deepOrange),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.web, color: Colors.blueAccent),
                iconSize: 70.0,
                onPressed: () {Navigator.of(context).pushNamed("/radio");},
              ),
              new Text("Second Page")
            ]
          ),
        ),
      )
    );
  }
}

class WebviewDemo extends StatefulWidget {
  final String title;
  WebviewDemo({Key key, this.title}) : super(key:key);

  @override
  State <StatefulWidget> createState() {
    var radioPageState = _WebviewDemoState();
    return _WebviewDemoState();
  }

}

class _WebviewDemoState extends State<WebviewDemo> {
  
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("radio Page"), 
        backgroundColor: Colors.blueGrey),
      body: Builder(
        builder: (BuildContext context) {
          return WebView ( 
            //initialUrl: 'https://www.google.com/',  //test Purpose
            initialUrl: 'https://www.cruzdelsurbolivia.com/red-nacional',
            //initialUrl: 'https://soundcloud.com/user9465084/our-times-the-happy-nobodies',
            javascriptMode: JavascriptMode.unrestricted,
          );
        },
      )
    );
  }

}


