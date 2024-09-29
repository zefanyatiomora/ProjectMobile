import 'package:flutter/material.dart';
import 'package:login_page/lupaKataSandi_page.dart'; 

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input Fields dan Login Button
            const TextField(
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implementasi Login di sini
              },
              child: const Text("Login"),
            ),
            const SizedBox(height: 20),

            // Teks atau tombol "Lupa Kata Sandi"
            TextButton(
              onPressed: () {
                // Navigasi ke halaman lupa kata sandi
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordPage(),
                  ),
                );
              },
              child: const Text("Lupa Kata Sandi?"),
            ),
          ],
        ),
      ),
    );
  }
}
