import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            height: height * 0.25,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Color.fromARGB(255, 2, 58, 104),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/polinema.png', height: 50),
                    const SizedBox(width: 10),
                    Image.asset('assets/jti.png', height: 50),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Sistem Manajemen Sumber Daya Manusia\nJurusan Teknologi Informasi\nPoliteknik Negeri Malang",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Body Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  // Warning Icon
                  const Icon(
                    Icons.warning_amber_rounded,
                    size: 60,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 16),

                  // Title
                  const Text(
                    "Lupa Kata Sandi",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 2, 58, 104),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Subtitle
                  const Text(
                    "Masukkan email Anda dan kami akan mengirimkan kata sandi kepada Anda",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Email Input Field
                  const CustomTextField(
                    iconColor: Color.fromARGB(255, 2, 58, 104),
                    hintText: 'E-mail',
                  ),
                  const SizedBox(height: 24),

                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      // Implement submit action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: const Text(
                      "Kirim",
                      style: TextStyle(
                        color: Color.fromARGB(255, 2, 58, 104),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Back to login button
                  TextButton.icon(
                    onPressed: () {
                      // Navigate back to login
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(255, 2, 58, 104),
                    ),
                    label: const Text(
                      "Kembali ke masuk",
                      style: TextStyle(
                        color: Color.fromARGB(255, 2, 58, 104),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color iconColor;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.8,
      height: height * 0.08,
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
            child: const Icon(
              Icons.email,
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
