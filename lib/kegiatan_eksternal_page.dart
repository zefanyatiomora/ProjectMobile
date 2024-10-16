import 'package:flutter/material.dart';

class KegiatanEksternalPage extends StatelessWidget {
  final TextEditingController namaKegiatanController = TextEditingController();
  final TextEditingController waktuKegiatanController = TextEditingController();
  String? selectedPIC;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kegiatan Eksternal',
          style: TextStyle(color: Colors.white), // Warna teks putih
        ),
        backgroundColor: Color(0xFF11315F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Memungkinkan scroll jika konten terlalu panjang
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Input Kegiatan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              
              // Card untuk Nama Kegiatan
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: namaKegiatanController,
                    decoration: InputDecoration(
                      labelText: 'Nama Kegiatan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              
              // Card untuk Waktu Kegiatan
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: waktuKegiatanController,
                    decoration: InputDecoration(
                      labelText: 'Waktu Kegiatan (YYYY-MM-DD)',
                      border: OutlineInputBorder(),
                    ),
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        waktuKegiatanController.text =
                            "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              
              // Card untuk Dropdown PIC
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedPIC,
                    hint: Text('Pilih PIC'),
                    items: [
                      DropdownMenuItem(
                        child: Text('Dosen A'),
                        value: 'Dosen A',
                      ),
                      DropdownMenuItem(
                        child: Text('Dosen B'),
                        value: 'Dosen B',
                      ),
                      DropdownMenuItem(
                        child: Text('Dosen C'),
                        value: 'Dosen C',
                      ),
                    ],
                    onChanged: (value) {
                      selectedPIC = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              
              // Tombol Simpan Kegiatan
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Informasi'),
                      content: Text('Kegiatan berhasil disimpan!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Simpan Kegiatan'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  backgroundColor: Color(0xFF11315F), // Warna latar belakang tombol
                  foregroundColor: Colors.white, // Warna teks tombol
                  elevation: 5, // Memberikan bayangan pada tombol
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
