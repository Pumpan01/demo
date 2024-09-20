import 'package:flutter/material.dart';
import 'profile.dart'; // นำเข้าไฟล์ profile.dart ที่อยู่ใน lib/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dorm Management App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          primary: Colors.orange,
          secondary: Colors.grey,
          background: const Color(0xFFF2F2F2), // เทาอ่อน
        ),
        scaffoldBackgroundColor: const Color(0xFFF2F2F2), // สีพื้นหลังแบบเทาอ่อน
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange, // สีส้มใน AppBar
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0, // ลบเงาของ AppBar
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;

  final List<Widget> _pages = [
    const BackPage(),
    const HomeContent(),
  ];

  void _onTabTapped(int index) {
    if (index == 2) {
      // นำไปหน้า ProfilePage เมื่อกดปุ่ม Profile
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // แสดงหน้าที่ตรงกับปุ่มที่เลือก
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: Colors.grey[850], // สีเทาเข้มสำหรับ BottomNavigationBar
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Back',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// เนื้อหาหน้า Home
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'HorPlus',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            MenuButton(
              icon: Icons.receipt_long,
              title: 'บิลค่าน้ำค่าไฟ',
              subtitle: 'Bill',
              color: Colors.white,
              iconColor: Colors.orange,
              onTap: () {
                // เพิ่มการทำงานเมื่อต้องการ
              },
            ),
            MenuButton(
              icon: Icons.payments,
              title: 'ชำระค่าน้ำค่าไฟ',
              subtitle: 'Pay bills',
              color: Colors.white,
              iconColor: Colors.orange,
              onTap: () {
                // เพิ่มการทำงานเมื่อต้องการ
              },
            ),
            MenuButton(
              icon: Icons.build,
              title: 'แจ้งซ่อม',
              subtitle: 'Report a repair',
              color: Colors.white,
              iconColor: Colors.orange,
              onTap: () {
                // เพิ่มการทำงานเมื่อต้องการ
              },
            ),
            MenuButton(
              icon: Icons.phone_in_talk,
              title: 'เบอร์ติดต่อฉุกเฉิน',
              subtitle: 'Sos call',
              color: Colors.white,
              iconColor: Colors.orange,
              onTap: () {
                // เพิ่มการทำงานเมื่อต้องการ
              },
            ),
          ],
        ),
      ),
    );
  }
}

// หน้า Back
class BackPage extends StatelessWidget {
  const BackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back Page'),
      ),
      body: const Center(
        child: Text('This is the back page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

// ปุ่มเมนูสำหรับ Home
class MenuButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final Color iconColor;
  final VoidCallback onTap;

  const MenuButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.iconColor,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color, // สีพื้นหลังของปุ่ม (สีขาว)
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: iconColor, // สีไอคอนส้ม
              ),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
