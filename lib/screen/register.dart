import 'package:flutter/material.dart';
import '../database/sqflite.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> _registerUser(BuildContext context) async {
    String nama = _namaController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    Map<String, dynamic> user = {
      DatabaseHelper.columnName: nama,
      DatabaseHelper.columnEmail: email,
      DatabaseHelper.columnPassword: password,
    };

    int userId = await _databaseHelper.insertUser(user);

    if (userId != 0) {
      // Registrasi berhasil
      print('Registrasi berhasil! User ID: $userId');
      _showRegistrationSuccessMessage(
          context); // Panggil notifikasi berhasil registrasi
    } else {
      // Registrasi gagal
      print('Registrasi gagal! Silakan coba lagi.');
    }
  }

  void _showRegistrationSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Registrasi berhasil!'),
        duration: Duration(seconds: 3), // Durasi tampilan snackbar
      ),
    );

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Login()), // Ganti dengan halaman login yang benar
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gunakan GlobalKey untuk Scaffold
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
                      controller: _namaController,
                      decoration: InputDecoration(
                        labelText: 'NAMA',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20),
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
                      onPressed: () => _registerUser(context),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        fixedSize: Size(1000, 50),
                        side: BorderSide(color: Colors.white, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ANJAY DAFTAR, SELAMAT MENONTON YA',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
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
