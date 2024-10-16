import 'package:flutter/material.dart';

class PengaturanProfilPage extends StatefulWidget {
  @override
  _PengaturanProfilPageState createState() => _PengaturanProfilPageState();
}

class _PengaturanProfilPageState extends State<PengaturanProfilPage> {
  final _formKey = GlobalKey<FormState>();
  String? _oldPassword;
  String? _newPassword;
  String? _confirmPassword;

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      // Tambahkan logika untuk reset password di sini
      // Misalnya, mengirim permintaan ke server atau menyimpan ke database
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password berhasil diubah!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan Profil'),
        backgroundColor: Color(0xFF11315F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reset Password',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password Lama',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan password lama';
                  }
                  return null;
                },
                onChanged: (value) {
                  _oldPassword = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password Baru',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan password baru';
                  } else if (value.length < 6) {
                    return 'Password harus memiliki minimal 6 karakter';
                  }
                  return null;
                },
                onChanged: (value) {
                  _newPassword = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password Baru',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value != _newPassword) {
                    return 'Password tidak cocok';
                  }
                  return null;
                },
                onChanged: (value) {
                  _confirmPassword = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _resetPassword,
                child: Text('Reset Password'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF11315F), // Warna tombol
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
