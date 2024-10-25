import 'package:flutter/material.dart';
import '../login.dart'; // นำเข้าไฟล์ login.dart

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // การ์ดข้อมูลห้องพัก
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ข้อมูลผู้เช่า',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const Divider(
                      color: Colors.orange,
                      thickness: 2,
                      height: 20,
                    ),
                    const SizedBox(height: 10),

                    // ชื่อผู้เช่า
                    _buildInfoRow(
                      label: 'ชื่อเต็ม',
                      value: 'นายสมชาย ใจดี',
                      icon: Icons.person_outline,
                    ),

                    // เบอร์โทรศัพท์
                    _buildInfoRow(
                      label: 'เบอร์โทรศัพท์',
                      value: '098-765-4321',
                      icon: Icons.phone_outlined,
                    ),

                    // เลขห้อง
                    _buildInfoRow(
                      label: 'ห้องพัก',
                      value: '101 (ห้องแอร์)',
                      icon: Icons.meeting_room_outlined,
                    ),

                    // ค่าเช่ารายเดือน
                    _buildInfoRow(
                      label: 'ค่าเช่ารายเดือน',
                      value: '3200 บาท',
                      icon: Icons.attach_money_outlined,
                    ),

                    // ผู้ติดต่อฉุกเฉิน
                    _buildInfoRow(
                      label: 'ผู้ติดต่อฉุกเฉิน',
                      value: 'นายสมปอง ใจดี (089-123-4567)',
                      icon: Icons.contact_phone_outlined,
                    ),

                    // Line ID
                    _buildInfoRow(
                      label: 'Line ID',
                      value: 'somchai123',
                      icon: Icons.message_outlined,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // ปุ่ม "ออกจากระบบ"
              ElevatedButton.icon(
                onPressed: () {
                  // เมื่อกดออกจากระบบ กลับไปที่หน้า Login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()), // ไปหน้า LoginPage
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // ปุ่มสีแดง
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.redAccent,
                  elevation: 5,
                ),
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  'ออกจากระบบ',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20), // ช่องว่างด้านล่างปุ่ม Logout
            ],
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันช่วยสร้างแถวข้อมูลผู้เช่าแต่ละรายการ
  Widget _buildInfoRow({required String label, required String value, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange, size: 28),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
