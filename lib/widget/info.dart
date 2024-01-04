import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Durasi animasi
    )..repeat(); // Animasi akan diulang terus menerus
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle:
                      _animationController.value * 2 * 3.1415, // Animasi rotasi
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'Assets/Img/netflix.png'), // Ganti dengan path gambar Anda
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              'Pemberitahuan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Kami mohon maaf atas ketidaknyamanan ini. Saat ini, aplikasi sedang dalam tahap pengembangan untuk meningkatkan pengalaman pengguna. Kami bekerja keras untuk memberikan fitur-fitur terbaik dan perbaikan yang diperlukan. Terima kasih atas kesabaran Anda dan pengertian Anda selama proses pengembangan ini. Harapannya, hasil dari perbaikan ini akan membawa pengalaman pengguna yang lebih baik dan memuaskan. Terima kasih banyak atas dukungan dan pengertian Anda.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Info(),
  ));
}
