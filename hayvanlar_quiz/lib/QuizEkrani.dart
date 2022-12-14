import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hayvanlar_quiz/sonucEkrani.dart';

import 'Hayvanlar.dart';
import 'Hayvanlardao.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({Key? key}) : super(key: key);

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {
  var sorular = <Hayvanlar>[];
  var yanlisSecenekler = <Hayvanlar>[];
  late Hayvanlar dogruSoru;
  var tumSecenekler = HashSet<Hayvanlar>();

  int soruSayac = 0;
  int dogruSayac = 0;
  int yanlisSayac = 0;

  String hayvanResimAdi = "placeholder.png";
  String buttonAyazi = "";
  String buttonByazi = "";
  String buttonCyazi = "";
  String buttonDyazi = "";

  @override
  void initState() {
    super.initState();

    sorulariAl();
  }

  Future<void> sorulariAl() async {
    sorular = await Hayvanlardao().rasgele5Getir();
    soruYukle();
  }

  Future<void> soruYukle() async {
    dogruSoru = sorular[soruSayac];

    hayvanResimAdi = dogruSoru.hayvan_resim;

    yanlisSecenekler =
        await Hayvanlardao().rasgele3YanlisGetir(dogruSoru.hayvan_id);

    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yanlisSecenekler[0]);
    tumSecenekler.add(yanlisSecenekler[1]);
    tumSecenekler.add(yanlisSecenekler[2]);

    buttonAyazi = tumSecenekler.elementAt(0).hayvan_ad;
    buttonByazi = tumSecenekler.elementAt(1).hayvan_ad;
    buttonCyazi = tumSecenekler.elementAt(2).hayvan_ad;
    buttonDyazi = tumSecenekler.elementAt(3).hayvan_ad;

    setState(() {});
  }

  void soruSayacKontrol() {
    soruSayac = soruSayac + 1;
    if (soruSayac != 5) {
      soruYukle();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => SonucEkrani(
                    dogruSayisi: dogruSayac,
                  )));
    }
  }

  void dogruKontrol(String buttonYazi) {
    if (dogruSoru.hayvan_ad == buttonYazi) {
      dogruSayac = dogruSayac + 1;
    } else {
      yanlisSayac = yanlisSayac + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("resimler/soruisareti.png"),
                    fit: BoxFit.cover))),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Doğru : $dogruSayac",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text(
                    "Yanlış : $yanlisSayac",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
              soruSayac != 5
                  ? Text(
                      "${soruSayac + 1}. Soru",
                      style: TextStyle(fontSize: 30, color: Colors.grey),
                    )
                  : Text(
                      "5. Soru",
                      style: TextStyle(fontSize: 30),
                    ),
              Image.asset("resimler/$hayvanResimAdi"),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      dogruKontrol(buttonAyazi);
                      soruSayacKontrol();
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.grey),
                    child: Text(buttonAyazi)),
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      dogruKontrol(buttonByazi);
                      soruSayacKontrol();
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.grey),
                    child: Text(buttonByazi)),
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      dogruKontrol(buttonCyazi);
                      soruSayacKontrol();
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.grey),
                    child: Text(buttonCyazi)),
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      dogruKontrol(buttonDyazi);
                      soruSayacKontrol();
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.grey),
                    child: Text(buttonDyazi)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
