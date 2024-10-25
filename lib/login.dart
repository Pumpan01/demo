import 'package:flutter/material.dart';
import 'UI/home_page.dart'; // นำเข้าไฟล์หน้า HomePage
import 'admin/main_admin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  // ฟังก์ชันสำหรับแสดง Popup แจ้งเตือน
  void _showErrorPopup(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('เกิดข้อผิดพลาด'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // ปิด Popup
              },
              child: const Text('ตกลง'),
            ),
          ],
        );
      },
    );
  }

  // ฟังก์ชันตรวจสอบการล็อกอิน
  void _login() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showErrorPopup('กรุณากรอกอีเมลและรหัสผ่าน'); // แสดง Popup ถ้าไม่ได้กรอกข้อมูล
      return;
    }

    if (_emailController.text == "a" && _passwordController.text == "a") {
      // ถ้าล็อกอินสำเร็จ ให้ไปหน้า HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AdminApp()),
      );
    } else {
      // แสดง Popup ถ้าล็อกอินไม่สำเร็จ
      _showErrorPopup('อีเมลหรือรหัสผ่านไม่ถูกต้อง');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              
              // โลโก้
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Image.asset(
                  'images/logohorplus.png',
                  width: 150,
                  height: 150,
                ),
              ),
              
              const SizedBox(height: 30),

              const Text(
                'เข้าสู่ระบบ',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 30),

              // ช่องกรอกอีเมล
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'อีเมล',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.email_outlined, color: Colors.orange),
                ),
              ),
              const SizedBox(height: 20),

              // ช่องกรอกรหัสผ่าน
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'รหัสผ่าน',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.lock_outline, color: Colors.orange),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.orange,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // ปุ่มเข้าสู่ระบบ
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.orangeAccent,
                  elevation: 10,
                ),
                child: const Text(
                  'เข้าสู่ระบบ',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
