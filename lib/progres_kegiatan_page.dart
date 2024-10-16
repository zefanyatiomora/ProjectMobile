import 'package:flutter/material.dart';
import 'progres_kegiatan2_page.dart';

class ProgressKegiatanPage extends StatelessWidget {
  final List<String> kegiatanList = [
    'Panitia Akreditasi Jurusan Teknologi Informasi Tahun 2024',
    'Kegiatan Seminar Teknologi Informasi',
    'Pelatihan Pengembangan Diri',
    'Workshop Pemrograman Flutter',
    'Kegiatan Penelitian Bersama Mahasiswa',
    'Pengabdian Masyarakat di Desa',
    'Kegiatan Pertukaran Pelajar',
    'Pameran Inovasi dan Teknologi',
    'Kegiatan Olimpiade Sains',
    'Kegiatan Baksos (Bakti Sosial)',
    'Pelatihan Soft Skills untuk Mahasiswa',
    'Kegiatan Kunjungan Industri',
    'Kegiatan Mentoring untuk Mahasiswa Baru',
    'Konferensi Nasional Teknologi Informasi',
    'Kegiatan Webinar dan Diskusi Online',
    'Rapat Kerja Tahunan',
    'Kegiatan Olahraga dan Kebugaran',
    'Kegiatan Hari Pendidikan Nasional',
    'Kegiatan Penyuluhan Kesehatan',
  ];

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Teks "Pilihan Kegiatan"
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Pilihan Kegiatan',
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
                color: Color(0xFF11315F), // Warna judul
              ),
            ),
          ),
          Expanded(
            // Menampung ListView
            child: ListView.builder(
              itemCount: kegiatanList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4, // Efek bayangan
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Margin untuk card
                  child: ListTile(
                    title: Text(
                      kegiatanList[index],
                      style: TextStyle(
                        fontSize: 18, // Ukuran font
                        color: Colors.black, // Warna teks
                      ),
                    ),
                    onTap: () {
                      // Navigasi ke halaman ProgressKegiatan2Page dengan nama kegiatan
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProgressKegiatan2Page(kegiatan: kegiatanList[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}