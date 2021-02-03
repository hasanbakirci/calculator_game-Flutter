import 'package:flutter/material.dart';
import 'calculator_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static int min = 1;
  static int max = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            color: Colors.blue[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Min",
                  style: TextStyle(fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: IconButton(
                          icon: Icon(Icons.remove, size: 25.0),
                          onPressed: () {
                            if (min > 1) {
                              setState(() {
                                min--;
                              });
                            }
                          }),
                    ),
                    SizedBox(width: 16),
                    Text(
                      min.toString(),
                      style:
                          TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(width: 16),
                    IconButton(
                        icon: Icon(Icons.add, size: 25.0),
                        onPressed: () {
                          if (max > min + 1) {
                            setState(() {
                              min++;
                            });
                          }
                        }),
                  ],
                ),
                SizedBox(height: 25),
                Text(
                  "Max",
                  style: TextStyle(fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: IconButton(
                          icon: Icon(Icons.remove, size: 25.0),
                          onPressed: () {
                            if (max > 2 && max > min + 1) {
                              setState(() {
                                max--;
                              });
                            }
                          }),
                    ),
                    SizedBox(width: 16),
                    Text(
                      max.toString(),
                      style:
                          TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(width: 16),
                    IconButton(
                        icon: Icon(Icons.add, size: 25.0),
                        onPressed: () {
                          if (min < max + 1) {
                            setState(() {
                              max++;
                            });
                          }
                        }),
                  ],
                )
              ],
            ),
          )),
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.blue[100],
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: <Widget>[
                    ChooseCard("+"),
                    ChooseCard("-"),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget ChooseCard(String text) {
    return InkWell(
      child: Card(
          elevation: 10,
          child: Center(
              child: Text(
            text,
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          )),
          color: Colors.blue),
      onTap: () {
        if (text == "+") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CalculatorScreen(
                islem: text,
                min: min,
                max: max,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CalculatorScreen(
                islem: text,
                min: min,
                max: max,
              ),
            ),
          );
        }
      },
    );
  }
}
