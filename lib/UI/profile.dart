import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../login.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'ข้อมูลห้องพัก',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
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
                    Text(
                      'ข้อมูลผู้เช่า',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
                      ),
                    ),
                    const Divider(
                      color: Colors.orange,
                      thickness: 2,
                      height: 20,
                    ),
                    const SizedBox(height: 10),

                    // ข้อมูลผู้เช่า
                    _buildInfoRow(
                      label: 'ชื่อเต็ม',
                      value: 'นายภูมพาน นิลนวล',
                      icon: FontAwesomeIcons.user,
                    ),
                    _buildInfoRow(
                      label: 'เบอร์โทรศัพท์',
                      value: '098-765-4321',
                      icon: FontAwesomeIcons.phone,
                    ),
                    _buildInfoRow(
                      label: 'ห้องพัก',
                      value: '101 (ห้องแอร์)',
                      icon: FontAwesomeIcons.doorClosed,
                    ),
                    _buildInfoRow(
                      label: 'ค่าเช่ารายเดือน',
                      value: '3200 บาท',
                      icon: FontAwesomeIcons.moneyBillWave,
                    ),
                    _buildInfoRow(
                      label: 'ผู้ติดต่อฉุกเฉิน',
                      value: 'นายวิชญพัฒน์ เชาวนีรนาท (089-123-4567)',
                      icon: FontAwesomeIcons.phoneSquareAlt,
                    ),
                    _buildInfoRow(
                      label: 'Line ID',
                      value: 'ILOVEUHORPLUS01',
                      icon: FontAwesomeIcons.line,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // ปุ่ม "ออกจากระบบ"
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.redAccent,
                  elevation: 5,
                ),
                icon: const Icon(FontAwesomeIcons.signOutAlt, color: Colors.white),
                label: Text(
                  'ออกจากระบบ',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),
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
