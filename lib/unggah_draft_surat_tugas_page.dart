import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // Tambahkan import untuk file_picker

class UnggahDraftSuratTugasPage extends StatelessWidget {
  // Daftar nama kegiatan
  final List<String> kegiatan = [
    'Kegiatan 1: Seminar',
    'Kegiatan 2: Workshop',
    'Kegiatan 3: Rapat',
    'Kegiatan 4: Lomba',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text(
          'Agenda Kegiatan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF11315F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih kegiatan untuk mengunggah file draft surat tugas:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: kegiatan.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(kegiatan[index]),
                      trailing: ElevatedButton(
                        onPressed: () async {
                          // Memilih file
                          String? filePath = await _pickFile();
                          if (filePath != null) {
                            // Tampilkan snackbar atau lakukan pengunggahan
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('File yang dipilih: $filePath untuk ${kegiatan[index]}'),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Tidak ada file yang dipilih.'),
                              ),
                            );
                          }
                        },
                        child: Text('Unggah Draft'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _pickFile() async {
    // Menggunakan file_picker untuk memilih file
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    // Mengembalikan path file jika ada, atau null jika tidak ada file yang dipilih
    if (result != null && result.files.isNotEmpty) {
      return result.files.first.path; // Mengembalikan path dari file yang dipilih
    }
    return null; // Mengembalikan null jika tidak ada file yang dipilih
  }
}
