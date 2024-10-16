import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

class AgendaKegiatanPage extends StatefulWidget {
  @override
  _AgendaKegiatanPageState createState() => _AgendaKegiatanPageState();
}

class _AgendaKegiatanPageState extends State<AgendaKegiatanPage> {
  final List<Map<String, String>> kegiatanList = [
    {'name': 'Kegiatan 1', 'category': 'Bidang Ilmu 1', 'date': '12 Oct 2024'},
    {'name': 'Kegiatan 2', 'category': 'Bidang Ilmu 2', 'date': '14 Oct 2024'},
    {'name': 'Kegiatan 3', 'category': 'Bidang Ilmu 3', 'date': '16 Oct 2024'},
  ];

  String searchQuery = '';

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
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Pencarian',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Temukan Penawaran Kegiatan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: kegiatanList.length,
                itemBuilder: (context, index) {
                  final kegiatan = kegiatanList[index];
                  if (kegiatan['name']!.toLowerCase().contains(searchQuery)) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(kegiatan['name']!),
                        subtitle: Text('${kegiatan['category']} - ${kegiatan['date']}'),
                        trailing: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AgendaDetailPage(
                                  activityName: kegiatan['name']!,
                                ),
                              ),
                            );
                          },
                          child: Text('Selengkapnya'),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AgendaDetailPage extends StatefulWidget {
  final String activityName;

  const AgendaDetailPage({required this.activityName});

  @override
  _AgendaDetailPageState createState() => _AgendaDetailPageState();
}

class _AgendaDetailPageState extends State<AgendaDetailPage> {
  List<Map<String, String>> agendaItems = [
    {'title': 'Agenda 1', 'description': 'Detail untuk Agenda 1'},
    {'title': 'Agenda 2', 'description': 'Detail untuk Agenda 2'},
    {'title': 'Agenda 3', 'description': 'Detail untuk Agenda 3'},
  ];

  List<Map<String, String>> filteredAgendaItems = [];
  String searchQuery = '';

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedFile;
  String? selectedMember;
  final List<String> memberList = ['Anggota 1', 'Anggota 2', 'Anggota 3'];

  final TextEditingController agendaTitleController = TextEditingController();
  final TextEditingController agendaDescriptionController = TextEditingController();
  final TextEditingController agendaPlaceController = TextEditingController();
  final TextEditingController agendaWeightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredAgendaItems = List.from(agendaItems);
  }

  void _filterAgendaItems(String query) {
    setState(() {
      searchQuery = query;
      filteredAgendaItems = agendaItems
          .where((agenda) => agenda['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
    
  }
  

  void _showAgendaDialog({int? agendaIndex}) {
    if (agendaIndex != null) {
      agendaTitleController.text = filteredAgendaItems[agendaIndex]['title']!;
      agendaDescriptionController.text = filteredAgendaItems[agendaIndex]['description']!;
    } else {
      agendaTitleController.clear();
      agendaDescriptionController.clear();
      agendaPlaceController.clear();
      agendaWeightController.clear();
      selectedMember = null;
      selectedDate = null;
      selectedTime = null;
      selectedFile = null;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(agendaIndex == null ? 'Tambah Agenda Baru' : 'Edit Agenda'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Nama Agenda'),
                  controller: agendaTitleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Deskripsi'),
                  controller: agendaDescriptionController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Tempat Agenda'),
                  controller: agendaPlaceController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Bobot Anggota'),
                  controller: agendaWeightController,
                  keyboardType: TextInputType.number,
                ),
                DropdownButtonFormField<String>(
                  value: selectedMember,
                  onChanged: (value) {
                    setState(() {
                      selectedMember = value;
                    });
                  },
                  items: memberList.map((member) {
                    return DropdownMenuItem<String>(
                      value: member,
                      child: Text(member),
                    );
                  }).toList(),
                  decoration: InputDecoration(labelText: 'Pilih Anggota'),
                ),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Tanggal',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (selectedDate != null) {
                          setState(() {
                            agendaDescriptionController.text += "\n${DateFormat('dd MMM yyyy').format(selectedDate!)}";
                          });
                        }
                      },
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Waktu',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.access_time),
                      onPressed: () async {
                        selectedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (selectedTime != null) {
                          setState(() {
                            agendaDescriptionController.text += "\n${selectedTime!.format(context)}";
                          });
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  icon: Icon(Icons.upload_file),
                  label: Text(selectedFile == null ? 'Unggah Dokumen' : 'Ganti Dokumen'),
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf', 'xls', 'xlsx'],
                    );
                    if (result != null) {
                      setState(() {
                        selectedFile = result.files.single.name;
                      });
                    }
                  },
                ),
                if (selectedFile != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('File dipilih: $selectedFile'),
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (agendaIndex == null) {
                  setState(() {
                    agendaItems.add({
                      'title': agendaTitleController.text,
                      'description': agendaDescriptionController.text,
                      // Simpan data tambahan di sini
                    });
                    _filterAgendaItems(searchQuery);
                  });
                } else {
                  setState(() {
                    agendaItems[agendaIndex] = {
                      'title': agendaTitleController.text,
                      'description': agendaDescriptionController.text,
                      // Simpan data tambahan di sini
                    };
                    _filterAgendaItems(searchQuery);
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text(agendaIndex == null ? 'Tambah' : 'Simpan'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteAgenda(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Hapus Agenda'),
          content: Text('Apakah Anda yakin ingin menghapus agenda ini?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  agendaItems.removeAt(index);
                  _filterAgendaItems(searchQuery);
                });
                Navigator.of(context).pop();
              },
              child: Text('Ya'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Tidak'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.activityName),
        backgroundColor: Color(0xFF11315F), // Warna latar belakang AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // Search Field
            TextField(
              onChanged: _filterAgendaItems,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Pencarian',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
             SizedBox(height: 20),
            Text(
              'Temukan Penawaran Kegiatan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // Add space between the search field and the button

            // Add Agenda Button
            ElevatedButton(
              onPressed: () => _showAgendaDialog(),
              child: Text('Tambah Agenda'),
            ),
            SizedBox(height: 20), // Add space between the button and the list

            // List of filtered agendas
            Expanded(
              child: ListView.builder(
                itemCount: filteredAgendaItems.length,
                itemBuilder: (context, index) {
                  final agenda = filteredAgendaItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(agenda['title']!),
                      subtitle: Text(agenda['description']!),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _showAgendaDialog(agendaIndex: index),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _confirmDeleteAgenda(index),
                          ),
                        ],
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
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AgendaKegiatanPage(),
  ));
}
