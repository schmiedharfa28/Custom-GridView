import 'package:flutter/material.dart';

class DetailGridView extends StatefulWidget {
  String? nama, image, keterangan;

  DetailGridView({this.nama, this.image, this.keterangan});

  @override
  _DetailGridViewState createState() => _DetailGridViewState();
}

class _DetailGridViewState extends State<DetailGridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.nama}"),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        children: [
          Container(
            height: 240.0,
            child: Hero(
              tag: widget.nama!,
              child: Material(
                child: InkWell(
                  child:
                      Image.asset('image/${widget.image}', fit: BoxFit.contain),
                ),
              ),
            ),
          ),
          BagianNama(
            nama: widget.nama!,
          ),
          BagianKeterangan(
            keterangan: widget.keterangan,
          )
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama});
  String? nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama!,
                  style: TextStyle(fontSize: 20, color: Colors.brown),
                ),
                Text(
                  '$nama\@gmail',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 40,
                color: Colors.yellow,
              ),
              Text(
                "14",
                style: TextStyle(fontSize: 18),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BagianKeterangan extends StatelessWidget {
  BagianKeterangan({this.keterangan});
  String? keterangan;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "$keterangan!",
            style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
