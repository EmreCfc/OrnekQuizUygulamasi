import 'package:flutter/material.dart';
import 'package:hayvanlar_quiz/QuizEkrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
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
              Text(
                "QUİZE HOŞGELDİNİZ",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizEkrani()));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.grey),
                    child: Text(
                      "BAŞLA",
                      style: TextStyle(fontSize: 20, color: Colors.yellow),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
