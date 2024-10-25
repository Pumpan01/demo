import 'package:flutter/material.dart';
import 'package:myproject/UI/notice_page.dart';
import 'package:myproject/UI/profile.dart';
import 'package:myproject/UI/report_repairs_page.dart';
import 'water_bill_page.dart';
import 'payment_history_page.dart';
import 'emergency_contact_page.dart';

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
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          primary: Colors.orange,
          secondary: Colors.grey,
          background: const Color(0xFFF2F2F2),
        ),
        scaffoldBackgroundColor: const Color(0xFFF2F2F2),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
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
  int _currentIndex = 1; // ค่าเริ่มต้นที่หน้าแรก (HomeContent)

  final List<Widget> _pages = [
    const NoticePage(), // หน้าประกาศ
    const HomeContent(), // หน้าเนื้อหาหลัก
    const ProfilePage(), // หน้าข้อมูลผู้ใช้
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // แสดงเนื้อหาของแต่ละหน้า
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 15,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onTabTapped,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'แจ้งเตือน',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'หน้าแรก',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'โปรไฟล์',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// หน้าหลัก (HomeContent) ที่มีปุ่มต่างๆ
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'HorPlus',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildMenuButton(
              context,
              icon: Icons.receipt_long,
              title: 'บิลค่าน้ำค่าไฟ',
              subtitle: 'บิล',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const WaterBillPage()), // ไปหน้าบิลค่าน้ำค่าไฟ
                );
              },
            ),
            _buildMenuButton(
              context,
              icon: Icons.payments,
              title: 'ประวัติการชำระ', // เพิ่มเครื่องหมาย ' ที่หายไป
              subtitle: 'ประวัติ',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PaymentHistoryPage()), // ลบ const ถ้าไม่จำเป็น
                );
              },
            ),
            _buildMenuButton(
              context,
              icon: Icons.build,
              title: 'แจ้งซ่อม/ร้องเรียน',
              subtitle: 'ซ่อม/ร้องเรียน',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ReportRepairsPage()), // ไปหน้าแจ้งซ่อม
                );
              },
            ),
            _buildMenuButton(
              context,
              icon: Icons.phone_in_talk,
              title: 'เบอร์ติดต่อฉุกเฉิน',
              subtitle: 'ฉุกเฉิน',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const EmergencyContactPage()), // ไปหน้าเบอร์ติดต่อฉุกเฉิน
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // ฟังก์ชันสร้างปุ่มเมนู
  Widget _buildMenuButton(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
                color: Colors.orange,
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
