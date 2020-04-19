import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
      width: sizeX,
      height: sizeY,
      child: Stack(
        children: showPizzLayout(sizeX, sizeY),
      ),
    );
  }

  List<Widget> showPizzLayout(double sizeX, double sizeY) {
    List<Widget> layoutChildren = List<Widget>();
    Container backGround = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('http://bit.ly/pizzaimage'),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
    layoutChildren.add(backGround);
    Positioned pizzCard = Positioned(
      top: sizeY / 10,
      left: sizeX / 7,
      child: Card(
        elevation: 12,
        color: Colors.white70,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: <Widget>[
            Text(
              "Domino Pizza",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "This pizza is made up of tomator, \ncheese, chicken.\n\n Seriously delicious.",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
    layoutChildren.add(pizzCard);
    Positioned buttonOrder = Positioned(
      bottom: sizeY / 20,
      left: sizeX / 20,
      width: sizeX - sizeY / 10,
      child: RaisedButton(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.orange,
        child: Text(
          "Order Now",
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        onPressed: () {},
      ),
    );
    layoutChildren.add(buttonOrder);
    return layoutChildren;
  }
}
