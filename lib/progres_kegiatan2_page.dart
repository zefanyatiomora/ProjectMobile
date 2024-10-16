import 'package:flutter/material.dart';

class ProgressKegiatan2Page extends StatefulWidget {
  final String kegiatan; // Tambahkan parameter untuk nama kegiatan

  ProgressKegiatan2Page({required this.kegiatan});

  @override
  _ProgressKegiatanPageState createState() => _ProgressKegiatanPageState();
}

class _ProgressKegiatanPageState extends State<ProgressKegiatan2Page> {
  double _progressValue = 0.75; // Nilai progres awal dalam persen
  final _progressController = TextEditingController();
  final _keteranganController = TextEditingController();
  String? _bebanKerja; // Beban kerja (ringan, sedang, tinggi)

  @override
  void dispose() {
    _progressController.dispose();
    _keteranganController.dispose();
    super.dispose();
  }

  void _updateProgress() {
    setState(() {
      // Update progres dari input pengguna
      _progressValue = double.tryParse(_progressController.text) ?? _progressValue / 100;
    });

    // Lakukan tindakan lain untuk memperbarui data (seperti kirim ke backend)
    print("Progres diperbarui: ${(_progressValue * 100).toStringAsFixed(0)}%");
    print("Keterangan: ${_keteranganController.text}");
    print("Beban Kerja: $_bebanKerja");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Progress Kegiatan',
          style: TextStyle(color: Colors.white), // Mengubah warna teks menjadi putih
        ),
        backgroundColor: Color(0xFF11315F), // Warna biru utama
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Card untuk Nama Kegiatan
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Kegiatan: ${widget.kegiatan}', // Menggunakan parameter kegiatan
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Waktu: 1 Oktober 2024 – 15 Oktober 2024',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Timeline Kegiatan (daftar agenda)
            Text(
              'Timeline:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('- Persiapan Dokumen Akreditasi (1-5 Oktober 2024)'),
                    Text('- Pengumpulan Data (6-10 Oktober 2024)'),
                    Text('- Presentasi Akreditasi (11-15 Oktober 2024)'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Progres
            Text(
              'Progres: ${(_progressValue * 100).toStringAsFixed(0)}%',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: _progressValue,
              backgroundColor: Colors.grey[300],
              color: Color(0xFF11315F),
            ),
            SizedBox(height: 20),

            // Input untuk memperbarui progres
            TextField(
              controller: _progressController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan progres (0-100)',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),

            // Keterangan
            TextField(
              controller: _keteranganController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Keterangan Progres',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),

            // Beban Kerja
            DropdownButtonFormField<String>(
              value: _bebanKerja,
              onChanged: (String? newValue) {
                setState(() {
                  _bebanKerja = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: 'Beban Kerja Kegiatan',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              items: [
                DropdownMenuItem(
                  value: 'Ringan',
                  child: Text('Ringan'),
                ),
                DropdownMenuItem(
                  value: 'Sedang',
                  child: Text('Sedang'),
                ),
                DropdownMenuItem(
                  value: 'Tinggi',
                  child: Text('Tinggi'),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Daftar Anggota Tim
            Text(
              'Anggota Tim:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('- PIC / Ketua Pelaksana: Zefanya Tiomora Siagian'),
                    Text('- Pembina: Dr. Budi Santoso'),
                    Text('- Sekretaris: Dinda Alfi Rahma'),
                    Text('- Anggota: David Maulana, Annisa Putri, Rizki Dwi Saputra'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Tombol untuk memperbarui progres
            ElevatedButton(
              onPressed: _updateProgress,
              child: Text('Update Progress'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF11315F), // Warna latar belakang tombol
                foregroundColor: Colors.white, // Warna teks tombol
              ),
            ),
          ],
        ),
      ),
    );
  }
}
