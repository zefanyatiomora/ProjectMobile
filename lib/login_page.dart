import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF11315F), // Warna latar belakang
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8.0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            width: 300, // Mengatur lebar container lebih kecil
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Menambahkan dua logo bersebelahan
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Rata tengah
                  children: [
                    Image(
                      image: AssetImage('assets/polinema.png'),
                      height: 80,
                    ),
                    const SizedBox(width: 8), // Mengurangi jarak antar logo
                    Image(
                      image: AssetImage('assets/jti.png'),
                      height: 80,
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Judul
                const Text(
                  'Sistem Manajemen \n'
                  'Sumber Daya Manusia\n'
                  'Jurusan Teknologi Informasi\n'
                  'Politeknik Negeri Malang',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF11315F),
                  ),
                ),
                const SizedBox(height: 30),

                // Field Nama Pengguna
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Pengguna',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white, // Mengubah warna fill menjadi putih
                    filled: true,
                  ),
                ),
                const SizedBox(height: 20),

                // Field Kata Sandi
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Kata Sandi',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white, // Mengubah warna fill menjadi putih
                    filled: true,
                  ),
                ),
                const SizedBox(height: 20),

                // Tombol Login
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/dashboard');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF11315F), // Warna latar belakang
                    foregroundColor: Colors.white, // Menggunakan foregroundColor untuk teks
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  ),
                  child: const Text('LOGIN'),
                ),
                const SizedBox(height: 10),

                // Teks "Lupa Kata Sandi?"
                TextButton(
                  onPressed: () {
                    // Aksi ketika klik "Lupa Kata Sandi"
                  },
                  child: const Text('Lupa Kata Sandi?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
