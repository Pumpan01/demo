import 'package:flutter/material.dart';
import 'main.dart'; // นำเข้า main.dart เพื่อใช้ Navigator ไปหน้า Main

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange, // ใช้สีส้มสำหรับ AppBar
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'ข้อมูลห้องพัก',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // จัดข้อความให้เรียงทางซ้าย
          children: [
            // ข้อมูลผู้เช่า
            const Text(
              'ชื่อเต็ม: นายสมชาย ใจดี',  // ชื่อจริงและนามสกุล
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            
            const Text(
              'หมายเลขโทรศัพท์: 098-765-4321',  // เบอร์โทรศัพท์สำหรับติดต่อ
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            
            // ข้อมูลห้องพัก
            const Text(
              'เลขห้อง: 101 (ห้องแอร์)',  // หมายเลขห้องพร้อมประเภทห้อง
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            
            const Text(
              'ค่าเช่ารายเดือน: 3200 บาท',  // ค่าเช่ารายเดือน
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            
            // ผู้ติดต่อฉุกเฉิน
            const Text(
              'ผู้ติดต่อฉุกเฉิน: นายสมปอง ใจดี (เบอร์: 089-123-4567)',  // ผู้ติดต่อฉุกเฉิน
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            
            // Line ID
            const Text(
              'Line ID: somchai123',  // Line ID ของผู้เช่า
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 40),

            // ปุ่มต่างๆ อยู่ตรงกลาง
            Center(
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // เพิ่มการทำงานเมื่อต้องการแสดงยอดค้างชำระ
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PaymentStatusPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    icon: const Icon(Icons.payment, color: Colors.white),
                    label: const Text(
                      'ยอดค้างชำระ/สถานะการชำระเงิน',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      // เพิ่มการทำงานเมื่อต้องการดูประวัติการชำระเงิน
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PaymentHistoryPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    icon: const Icon(Icons.history, color: Colors.white),
                    label: const Text(
                      'ประวัติการชำระเงิน',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
      // BottomNavigationBar เหมือนกับหน้า Main
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[850], // สีเทาเข้มสำหรับ BottomNavigationBar
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          if (index == 0) {
            Navigator.pop(context); // กลับไปยังหน้าเดิมเมื่อกดปุ่ม "Back"
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyApp()), // กลับไปหน้า MainPage
            );
          }
        },
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

// หน้าดูยอดค้างชำระ/สถานะการชำระเงิน
class PaymentStatusPage extends StatelessWidget {
  const PaymentStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สถานะการชำระเงิน'),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text('ยอดค้างชำระ: 0 บาท\nสถานะการชำระเงิน: ชำระครบแล้ว'),
      ),
    );
  }
}

// หน้าดูประวัติการชำระเงิน
class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ประวัติการชำระเงิน'),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text('วันที่ชำระ: 01/09/2024\nจำนวนเงิน: 3200 บาท\nช่องทาง: โอนผ่านธนาคาร'),
      ),
    );
  }
}
