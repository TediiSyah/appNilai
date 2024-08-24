import 'package:flutter/material.dart';

void main() {
  runApp(AppNilai());
}

class AppNilai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Penilaian Siswa',
      home: PenilaianPage(),
    );
  }
}

class PenilaianPage extends StatefulWidget {
  @override
  _PenilaianPageState createState() => _PenilaianPageState();
}

class _PenilaianPageState extends State<PenilaianPage> {
  final _controller = TextEditingController();
  String _hasil = '';

  void _hitungKategori() {
    setState(() {
      final nilai = int.tryParse(_controller.text);
      if (nilai == null || nilai < 0 || nilai > 100) {
        _hasil = 'Nilai tidak valid! Masukkan angka antara 0 hingga 100.';
      } else if (nilai >= 85) {
        _hasil = 'Kategori: A';
      } else if (nilai >= 70) {
        _hasil = 'Kategori: B';
      } else if (nilai >= 55) {
        _hasil = 'Kategori: C';
      } else {
        _hasil = 'Kategori: D';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nilai Siswa'),
        backgroundColor: const Color.fromARGB(255, 4, 79, 141),
        foregroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan nilai siswa (0-100)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 4, 79, 141),
                  foregroundColor: Colors.white),
              onPressed: _hitungKategori,
              child: Text('Hitung'),
            ),
            SizedBox(height: 10),
            Text(
              _hasil,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
