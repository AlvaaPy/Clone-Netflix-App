import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      home: DownloadPage(),
    );
  }
}

class DownloadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black, brightness: Brightness.dark),
      home: DownloadView(),
    );
  }
}

final TextStyle downloadLabelStyle =
    TextStyle(fontSize: 12, color: Colors.white);

class DownloadView extends StatelessWidget {
  final List<String> downloadedVideos = [
    'Fight Club', // Ganti dengan nama video yang diunduh
    'Starwars',
    'Tag',
    // tambahkan video lain di sini jika diperlukan
  ];

  final List<String> imagePaths = [
    "Assets/Img/12.jpg",
    "Assets/Img/starwars.jpg",
    "Assets/Img/10.jpg",
    // tambahkan path gambar lain di sini jika diperlukan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Downloaded Videos'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: downloadedVideos.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: Image.asset(imagePaths[index]),
                title: Text(downloadedVideos[index]),
                onTap: () {
                  // Tambahkan aksi yang ingin dilakukan ketika item list di-tap
                  // Misalnya, navigasi ke halaman tampilan video
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen(videoUrl: downloadedVideos[index])));
                },
              ),
              SizedBox(height: 1), // Jarak antara ListTile dan button
              ElevatedButton(
                onPressed: () {
                  // Aksi yang ingin dilakukan ketika tombol ditekan
                },
                child: Text('Watching'), // Text tombol
              ),
              SizedBox(height: 10), // Jarak antara setiap item
            ],
          );
        },
      ),
    );
  }
}
