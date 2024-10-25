import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContactPage extends StatelessWidget {
  const EmergencyContactPage({super.key});

  // ฟังก์ชันสำหรับการโทรออก
  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'ไม่สามารถโทรไปยัง $phoneNumber ได้';
    }
  }

  // แสดง popup สำหรับการกดโทร
  void _showCallPopup(BuildContext context, String name, String phoneNumber) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('โทรหา $name', style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Text('เบอร์โทร: $phoneNumber'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ยกเลิก', style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(context); // ปิด popup ก่อน
                _makePhoneCall(phoneNumber); // โทรออก
              },
              child: const Text('โทร', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เบอร์ติดต่อฉุกเฉิน'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildEmergencyContactCard(
              context,
              icon: Icons.local_police,
              title: 'ตำรวจ',
              subtitle: 'โทร 191',
              color: Colors.blue,
              phoneNumber: '191',
            ),
            _buildEmergencyContactCard(
              context,
              icon: Icons.local_hospital,
              title: 'โรงพยาบาล',
              subtitle: 'โทร 1669',
              color: Colors.red,
              phoneNumber: '1669',
            ),
            _buildEmergencyContactCard(
              context,
              icon: Icons.fire_truck,
              title: 'ดับเพลิง',
              subtitle: 'โทร 199',
              color: Colors.orange,
              phoneNumber: '199',
            ),
            _buildEmergencyContactCard(
              context,
              icon: Icons.support_agent,
              title: 'กู้ภัย',
              subtitle: 'โทร 1554',
              color: Colors.green,
              phoneNumber: '1554',
            ),
            _buildEmergencyContactCard(
              context,
              icon: Icons.phone,
              title: 'เจ้าของหอพัก',
              subtitle: 'โทร 089-123-4567',
              color: Colors.orange,
              phoneNumber: '089-123-4567',
            ),
          ],
        ),
      ),
    );
  }

  // สร้าง widget สำหรับเบอร์ติดต่อฉุกเฉินแต่ละรายการ
  Widget _buildEmergencyContactCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required String phoneNumber,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,  // เพิ่มเงาให้ card
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color, size: 30),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        onTap: () => _showCallPopup(context, title, phoneNumber),
      ),
    );
  }
}
