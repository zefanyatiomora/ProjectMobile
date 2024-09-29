import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
        body: Column(
      children: [
        Container(
          width: double.infinity,
          height: height * 0.17,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            color: Color.fromARGB(255, 2, 58, 104),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/polinema.png', height: 50),
                  Image.asset('assets/jti.png', height: 50),
                ],
              ),
              
              const SizedBox(height: 16),
              const Text(
                "Sistem Manajemen Sumber Daya Manusia\nJurusan Teknologi Informasi\nPoliteknik Negeri Malang",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 58, 104),
                ),
              ),
              const SizedBox(height: 20),
              // User Icon
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color.fromARGB(255, 2, 58, 104),
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 30),
             
              const CustomTextField(
                iconColor: Color.fromARGB(255, 2, 58, 104),
                hintText: 'Nama Pengguna',
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                iconColor: Color.fromARGB(255, 2, 58, 104),
                hintText: 'Kata Sandi',
                obscureText: true,
              ),
              const SizedBox(height: 30),
           
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const Text(
                          "Ingat saya",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 58, 104),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Lupa Kata Sandi?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 58, 104),
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Login Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Masuk",
                  style: TextStyle(
                    color: Color.fromARGB(255, 2, 58, 104),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Color iconColor;

  const CustomTextField(
      {super.key, required this.hintText,
      this.obscureText = false,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.6,
      height: height * 0.05,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 0.3,
          offset: const Offset(1, 2),
        )
      ]),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 40,
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Icon(
              obscureText ? Icons.lock : Icons.person,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
