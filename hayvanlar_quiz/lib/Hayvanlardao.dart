import 'Hayvanlar.dart';
import 'VeritabaniYardimcisi.dart';

class Hayvanlardao {
  Future<List<Hayvanlar>> rasgele5Getir() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM hayvanlar ORDER BY RANDOM() LIMIT 5");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Hayvanlar(
          satir["hayvan_id"], satir["hayvan_ad"], satir["hayvan_resim"]);
    });
  }

  Future<List<Hayvanlar>> rasgele3YanlisGetir(int hayvan_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM hayvanlar WHERE hayvan_id != $hayvan_id ORDER BY RANDOM() LIMIT 3");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Hayvanlar(
          satir["hayvan_id"], satir["hayvan_ad"], satir["hayvan_resim"]);
    });
  }
}
