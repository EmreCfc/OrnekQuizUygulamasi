import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  int dogruSayisi;
  SonucEkrani({required this.dogruSayisi});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
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
                "${widget.dogruSayisi} DOĞRU ${5 - widget.dogruSayisi} YANLIŞ",
                style: TextStyle(fontSize: 30, color: Colors.grey),
              ),
              Text(
                "%${((widget.dogruSayisi * 100) / 5).toInt()} Başarı",
                style: TextStyle(fontSize: 30, color: Colors.grey),
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.grey),
                    child: Text("TEKRAR DENE")),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
