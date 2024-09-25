import 'package:flutter/material.dart';
import 'profile.dart'; // นำเข้าไฟล์ profile.dart ที่อยู่ใน lib/
import 'notice_page.dart'; // นำเข้า notice_page.dart

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
        fontFamily: 'Poppins',  // ใช้ฟอนต์ Poppins เพื่อความทันสมัย
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          primary: Colors.orange,
          secondary: Colors.grey,
          background: const Color(0xFFF2F2F2), // สีพื้นหลังแบบเทาอ่อน
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
      home: const HomePage(), // หน้าเริ่มต้นเป็น HomePage
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1; // เปลี่ยนเป็น 1 เพื่อให้หน้าแรกเป็น HomeContent

  // รายการหน้าที่จะนำมาใช้ในแต่ละปุ่มของ BottomNavigationBar
  final List<Widget> _pages = [
    const NoticePage(), // หน้า Notice
    const HomeContent(),  // หน้า HomeContent
    const ProfilePage(),  // หน้า Profile
  ];

  // ฟังก์ชันจัดการการเปลี่ยนหน้าตามการกด BottomNavigationBar
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // แสดงหน้าที่ตรงกับปุ่มที่เลือกใน BottomNavigationBar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // เปลี่ยนสีพื้นหลังของ BottomNavigationBar เป็นสีขาว
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0), 
            topRight: Radius.circular(25.0),
          ), // ปรับมุมให้โค้งมน
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
            backgroundColor: Colors.white, // พื้นหลังของ BottomNavigationBar
            selectedItemColor: Colors.orange, // สีเมื่อถูกเลือก
            unselectedItemColor: Colors.grey, // สีเมื่อยังไม่ถูกเลือก
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'แจ้งเตือน', // เปลี่ยนเป็นภาษาไทย
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

// หน้าเนื้อหา Home
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HorPlus'),
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
              title: 'บิลค่าน้ำค่าไฟ',  // เปลี่ยนเป็นภาษาไทย
              subtitle: 'บิล',
              color: Colors.white,
              iconColor: Colors.orange,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('เลือกบิลค่าน้ำค่าไฟ')),
                );
              },
            ),
            MenuButton(
              icon: Icons.payments,
              title: 'ชำระค่าน้ำค่าไฟ',  // เปลี่ยนเป็นภาษาไทย
              subtitle: 'ชำระ',
              color: Colors.white,
              iconColor: Colors.orange,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('เลือกชำระค่าน้ำค่าไฟ')),
                );
              },
            ),
            MenuButton(
              icon: Icons.build,
              title: 'แจ้งซ่อม',  // เปลี่ยนเป็นภาษาไทย
              subtitle: 'ซ่อม',
              color: Colors.white,
              iconColor: Colors.orange,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('แจ้งซ่อม')),
                );
              },
            ),
            MenuButton(
              icon: Icons.phone_in_talk,
              title: 'เบอร์ติดต่อฉุกเฉิน',  // เปลี่ยนเป็นภาษาไทย
              subtitle: 'ฉุกเฉิน',
              color: Colors.white,
              iconColor: Colors.orange,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('เลือกเบอร์ติดต่อฉุกเฉิน')),
                );
              },
            ),
          ],
        ),
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
          color: color,
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
                color: iconColor,
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
