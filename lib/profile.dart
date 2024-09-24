import 'package:flutter/material.dart';
import 'package:myproject/Payment.dart';
import 'Payment.dart'; // นำเข้าไฟล์ payment.dart
import 'history.dart'; // นำเข้าไฟล์ history.dart
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // กลับไปยังหน้าเดิมเมื่อกดปุ่ม "Back"
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // จัดข้อความให้เรียงทางซ้าย
          children: [
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
            
            const Text(
              'ผู้ติดต่อฉุกเฉิน: นายสมปอง ใจดี (เบอร์: 089-123-4567)',  // ผู้ติดต่อฉุกเฉิน
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            
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
                        MaterialPageRoute(builder: (context) => const PaymentPage()), // ไปที่หน้า payment.dart
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
                        MaterialPageRoute(builder: (context) => const PaymentHistoryPage()), // ไปที่หน้า history.dart
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
    );
  }
}
