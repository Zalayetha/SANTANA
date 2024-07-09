import 'package:flutter/material.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});
  final String descriptionApp =
      "Aplikasi Sistem Analisis Teks Bencana adalah alat yang mendeteksi kategori terkait bencana, seperti jenis bencana, waktu kejadian, dampak, dan lokasi, dalam setiap kata pada sebuah kalimat.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "Halo, Selamat datang kembali.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 24),
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/Logo-Universitas-Budi-Luhur-Square.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "assets/Logo-Universitas-Budi-Luhur-Square.png")),
                              SizedBox(
                                width: 8,
                              ),
                              Text("Mohammad Zaghy Zalayetha Sofjan"),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "assets/Logo-Universitas-Budi-Luhur-Square.png")),
                              SizedBox(
                                width: 8,
                              ),
                              Text("Diva Restu Anggara Putra"),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "assets/Logo-Universitas-Budi-Luhur-Square.png")),
                              SizedBox(
                                width: 8,
                              ),
                              Text("Wira Yudha Mahardhika"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        descriptionApp,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const Text(
                  "Versi 1.0",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
