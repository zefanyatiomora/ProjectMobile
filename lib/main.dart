import 'package:flutter/material.dart';
import 'agenda_kegiatan_page.dart'; // Impor halaman agenda kegiatan
import 'dashboard_page.dart'; // Impor halaman dashboard
import 'dokumen_surat_tugas_page.dart'; // Impor halaman dokumen surat tugas
import 'unggah_draft_surat_tugas_page.dart'; // Impor halaman unggah draft surat tugas
import 'drawer.dart'; // Impor drawer
import 'kegiatan_eksternal_page.dart'; // Impor halaman kegiatan eksternal
import 'laporkan_progres_agenda_page.dart'; // Impor halaman laporan progress agenda
import 'login_page.dart'; // Impor halaman login
import 'pengaturan_profil_page.dart'; // Impor halaman pengaturan profil
import 'progres_kegiatan_page.dart'; // Impor halaman progress kegiatan
//import 'statistik_kinerja_page.dart'; // Impor halaman statistik kinerja

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/agenda-kegiatan': (context) => AgendaKegiatanPage(),
        '/progres-kegiatan': (context) => ProgressKegiatanPage(),
        '/kegiatan-eksternal': (context) => KegiatanEksternalPage(),
        '/laporkan-progres-agenda': (context) => LaporkanProgresAgendaPage(),
        //'/statistik-kinerja': (context) => StatistikKinerjaPage(),
        '/dokumen-surat-tugas': (context) => DokumenSuratTugasPage(),
        '/unggah-draft-surat-tugas': (context) => UnggahDraftSuratTugasPage(), // Tambahkan route baru
        '/pengaturan-profil': (context) => PengaturanProfilPage(),
      },
    );
  }
}

