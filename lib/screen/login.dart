import 'package:flutter/material.dart';
import "register.dart";
import '../database/sqflite.dart';
import '../widget/main2.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> _loginUser(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;

    Map<String, dynamic>? user = await _databaseHelper.getUser(email, password);

    if (user != null) {
      // Jika pengguna ditemukan, arahkan ke halaman utama
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                NetflixTabBar()), // Ganti dengan halaman utama yang sesuai
      );
    } else {
      // Jika pengguna tidak ditemukan, tampilkan pesan atau logika lainnya
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Gagal'),
            content: Text('Email atau password salah.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('Assets/Img/netflix_logo1.png', width: 150),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email or Phone number',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _loginUser(context),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,

                        fixedSize: Size(1000,
                            50), // Ubah warna latar belakang tombol menjadi merah
                        side: BorderSide(color: Colors.white, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        // Fungsi yang akan dijalankan saat tombol login ditekan
                        // Anda bisa menambahkan logika autentikasi di sini
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,

                        fixedSize: Size(1000,
                            50), // Ubah warna latar belakang tombol menjadi merah
                        // side: BorderSide(color: Colors.white, width: 2),
                        // shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5),
                        // ),
                      ),
                      child: Text(
                        'Baru Ya? Daftar Sekarang bang',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
