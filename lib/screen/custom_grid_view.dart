import 'package:flutter/material.dart';
import 'package:flutter_custom_grid_view/screen/detailcustomegridview.dart';

class CustomGridView extends StatefulWidget {
  @override
  _CustomGridViewState createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
//deklrasi data list
  List<Container> daftarMakananPadang = [];

  var itemMakanan = [
    {
      "nama": "Ati Ampela Kentang",
      "image": "ati-ampela.jpg",
      "Keterangan": "Ini Makanan Ati Ample Kentang"
    },
    {
      "nama": "Balado Cumi Asin",
      "image": "balado-cumi-asin.jpg",
      "Keterangan": "Ini Makanan Balado Cumi Asin"
    },
    {
      "nama": "Cumi Pedas Saus Tiram",
      "image": "cumi-pedas-saus-tiram.jpg",
      "Keterangan": "Ini Makanan Cumi Pedas Saus Tiram"
    },
    {
      "nama": "Rendang",
      "image": "rendang.jpg",
      "Keterangan": "Ini Makanan Rendang"
    },
    {
      "nama": "Udang Pedas Manis",
      "image": "udang-pedas-manis.jpg",
      "Keterangan": "Ini Makanan Udang Pedang Manis"
    },
  ];
  //method baru
  _buatDataListMakanan() async {
    //buat looping untuk menampilkan makanan
    for (var i = 0; i < itemMakanan.length; i++) {
      final dataMakanan = itemMakanan[i]; // variabel untuk data makanan

      final String? gambarMakanan = dataMakanan['image'];
      daftarMakananPadang.add(new Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailGridView(
                            nama: dataMakanan['nama'],
                            image: gambarMakanan,
                            keterangan: dataMakanan['keterangan'],
                          )));
            },
            child: Column(
              children: [
                Hero(
                  // animasi buat gambar
                  tag: dataMakanan["nama"] ?? "",
                  child: Image.asset(
                    'image/$gambarMakanan',
                    height: 125,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  dataMakanan['nama'] ?? "",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
              ],
            ),
          ),
        ),
      ));
    }
  }

  //proses background
  @override
  void initState() {
    super.initState();
    _buatDataListMakanan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apps Makanan Padang'),
        backgroundColor: Colors.deepOrange,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: daftarMakananPadang,
      ),
    );
  }
}
