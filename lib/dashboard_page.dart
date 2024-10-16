import 'package:flutter/material.dart';
import 'drawer.dart'; // File yang berisi drawer
import 'pengaturan_profil_page.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 5), // Jarak antara judul dan logo
            Image.asset(
              'assets/polinema.png', // Path ke logo Polinema
              height: 30, // Ukuran logo Polinema
            ),
            const SizedBox(width: 8), // Jarak antara logo Polinema dan logo aplikasi
            Image.asset(
              'assets/logo.png', // Path ke logo aplikasi
              height: 30, // Ukuran logo aplikasi
            ),
            const SizedBox(width: 8), // Jarak antara logo dan judul
            const Text(
              'SIM SDM JTI',
              style: TextStyle(color: Colors.white), // Warna putih untuk teks di app bar
            ),
          ],
        ),
        backgroundColor: const Color(0xFF11315F), // Warna biru utama
        iconTheme: const IconThemeData(color: Colors.white), // Mengatur warna ikon di AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/pengaturan-profil');
            },
          ),
        ],
      ),
      drawer: AppDrawer(), // Drawer untuk sidebar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Zefanya Tiomora Siagian | 123456789',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'SELAMAT DATANG',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Container untuk Notifikasi
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFF11315F)), // Garis tepi
                borderRadius: BorderRadius.circular(8.0), // Sudut membulat
              ),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pemberitahuan Baru
                  Text(
                    'Pemberitahuan Baru',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.notifications, color: Color(0xFF11315F)),
                      title: const Text('Panitia Akreditasi Jurusan Teknologi Informasi Tahun 2024'),
                      trailing: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/detail-kegiatan');
                        },
                        child: const Text('Detail'),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.notifications, color: Color(0xFF11315F)),
                      title: const Text('Panitia Expo Dies Natalis Polinema Tahun 2024'),
                      trailing: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/detail-kegiatan');
                        },
                        child: const Text('Detail'),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 10), // Jarak antar kategori
                  
                  // Agenda yang Harus Segera Dilakukan
                  Text(
                    'Agenda yang Harus Segera Dilakukan',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.calendar_today, color: Color(0xFF11315F)),
                      title: const Text('Rapat Panitia Skripsi 2024'),
                      subtitle: const Text('Tanggal: 20 Oktober 2024'),
                      trailing: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/detail-agenda');
                        },
                        child: const Text('Detail'),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.calendar_today, color: Color(0xFF11315F)),
                      title: const Text('Ujian Akhir Semester 2024'),
                      subtitle: const Text('Tanggal: 30 Oktober 2024'),
                      trailing: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/detail-agenda');
                        },
                        child: const Text('Detail'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF11315F),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) {
          // Aksi ketika item bottom navigation ditekan
          if (index == 0) {
            Navigator.pushNamed(context, '/dashboard');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/agenda');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/settings');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}
