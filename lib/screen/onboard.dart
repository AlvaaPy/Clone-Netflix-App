import 'package:flutter/material.dart';
import 'onboard2.dart'; // Pastikan import file LoginPage.dart

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double _opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();
    // Setelah build pertama kali selesai, atur opasitas menjadi 1 dengan durasi animasi 2 detik
    Future.delayed(Duration.zero, () {
      setState(() {
        _opacityLevel = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Navigasi ke halaman login saat gambar ditekan
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => onboard2(),
            ),
          );
        },
        child: Container(
          color: Colors.black,
          child: Center(
            child: AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _opacityLevel,
              child: Image.asset('Assets/Img/netflix_logo1.png', width: 200),
            ),
          ),
        ),
      ),
    );
  }
}
