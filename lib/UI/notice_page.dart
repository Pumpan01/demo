import 'package:flutter/material.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'แจ้งเตือน',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
        elevation: 0, // ลบเงาจาก AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildNoticeTile(
              icon: Icons.water_drop_outlined,
              title: 'ประกาศน้ำไม่ไหล',
              subtitle: 'วันนี้น้ำจะไม่ไหลตั้งแต่ 9 โมงเช้าถึงเที่ยง',
              context: context,
            ),
            const SizedBox(height: 16),
            _buildNoticeTile(
              icon: Icons.home,
              title: 'ห้องว่างเหลือ',
              subtitle: 'ห้องว่างตอนนี้: 101, 204, 305',
              context: context,
            ),
            const SizedBox(height: 16),
            _buildNoticeTile(
              icon: Icons.construction_outlined,
              title: 'ประกาศซ่อมบำรุง',
              subtitle: 'จะมีการซ่อมบำรุงในอาคาร เริ่มวันจันทร์นี้',
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  // ฟังก์ชันสำหรับสร้าง Tile ของประกาศแต่ละอัน
  Widget _buildNoticeTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required BuildContext context,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // เปลี่ยนทิศทางของเงา
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange, size: 30),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }
}
