import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorScreen extends StatefulWidget {
  final String islem;
  final int max;
  final int min;
  CalculatorScreen({Key key, this.islem, this.min, this.max}) : super(key: key);
  @override
  _CalculatorScreenState createState() =>
      _CalculatorScreenState(buIslem: islem, maxSayi: max, minSayi: min);
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String buIslem;
  int maxSayi;
  int minSayi;
  _CalculatorScreenState({this.buIslem, this.maxSayi, this.minSayi});

  static int sayi1;
  static int sayi2;
  static List<int> cevaplar = List(4);
  static Color dogru = Colors.green;
  static Color yanlis = Colors.red;
  static Map<String, Color> cevapRenk = {};
  bool _enabled = true;
  @override
  void initState() {
    soruVer(minSayi, maxSayi, buIslem);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            color: Colors.blue[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: Text(
                  "$sayi1 $buIslem $sayi2",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                )),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.blue[100],
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: <Widget>[
                    ChooseCard(cevaplar[0].toString(), "a"),
                    ChooseCard(cevaplar[1].toString(), "b"),
                    ChooseCard(cevaplar[2].toString(), "c"),
                    ChooseCard(cevaplar[3].toString(), "d"),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget ChooseCard(String text, String k) {
    return InkWell(
      child: Card(
          elevation: 10,
          child: Center(
              child: Text(
            text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          color: cevapRenk[k]),
      onTap: () {
        if (_enabled == true) {
          setState(() => _enabled = false);
          cevapSonuc(text, k, buIslem);
        }
      },
    );
  }

  void cevapSonuc(String text, String k, String buIslem) {
    setState(() {
      if (sayi1 + sayi2 == int.parse(text) && buIslem == "+") {
        cevapRenk[k] = dogru;
      } else if (sayi1 - sayi2 == int.parse(text) && buIslem == "-") {
        cevapRenk[k] = dogru;
      } else {
        cevapRenk[k] = yanlis;
      }
    });

    Timer(Duration(seconds: 1), () {
      soruVer(minSayi, maxSayi, buIslem);
    });
  }

  void soruVer(int minSayi, int maxSayi, String buIslem) {
    cevapRenk["a"] = Colors.blue;
    cevapRenk["b"] = Colors.blue;
    cevapRenk["c"] = Colors.blue;
    cevapRenk["d"] = Colors.blue;
    setState(() {
      sayi1 = Random().nextInt(maxSayi - minSayi) + minSayi;
      sayi2 = Random().nextInt(maxSayi - minSayi) + minSayi;
    });
    int rasgele = Random().nextInt(4);
    if (buIslem == "+") {
      switch (rasgele) {
        case 0:
          cevaplar[0] = sayi1 + sayi2;
          cevaplar[1] = sayi1 + sayi2 + 1;
          cevaplar[2] = sayi1 + sayi2 + 2;
          cevaplar[3] = sayi1 + sayi2 - 1;
          break;
        case 1:
          cevaplar[1] = sayi1 + sayi2;
          cevaplar[0] = sayi1 + sayi2 + 1;
          cevaplar[3] = sayi1 + sayi2 + 2;
          cevaplar[2] = sayi1 + sayi2 - 1;
          break;
        case 2:
          cevaplar[3] = sayi1 + sayi2;
          cevaplar[1] = sayi1 + sayi2 + 1;
          cevaplar[0] = sayi1 + sayi2 + 2;
          cevaplar[2] = sayi1 + sayi2 - 1;
          break;
        case 3:
          cevaplar[2] = sayi1 + sayi2;
          cevaplar[1] = sayi1 + sayi2 + 1;
          cevaplar[3] = sayi1 + sayi2 + 2;
          cevaplar[0] = sayi1 + sayi2 - 1;
          break;
      }
    } else {
      switch (rasgele) {
        case 0:
          cevaplar[0] = sayi1 - sayi2;
          cevaplar[1] = sayi1 - sayi2 + 1;
          cevaplar[2] = sayi1 - sayi2 + 2;
          cevaplar[3] = sayi1 - sayi2 - 1;
          break;
        case 1:
          cevaplar[1] = sayi1 - sayi2;
          cevaplar[0] = sayi1 - sayi2 + 1;
          cevaplar[3] = sayi1 - sayi2 + 2;
          cevaplar[2] = sayi1 - sayi2 - 1;
          break;
        case 2:
          cevaplar[3] = sayi1 - sayi2;
          cevaplar[1] = sayi1 - sayi2 + 1;
          cevaplar[0] = sayi1 - sayi2 + 2;
          cevaplar[2] = sayi1 - sayi2 - 1;
          break;
        case 3:
          cevaplar[2] = sayi1 - sayi2;
          cevaplar[1] = sayi1 - sayi2 + 1;
          cevaplar[3] = sayi1 - sayi2 + 2;
          cevaplar[0] = sayi1 - sayi2 - 1;
          break;
      }
    }
    setState(() => _enabled = true);
  }
}
