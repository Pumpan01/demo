import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

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

  // ฟังก์ชันสำหรับแสดงป๊อปอัปยืนยันการโทร
  void _showCallPopup(BuildContext context, String name, String phoneNumber) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'โทรหา $name',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          content: Text(
            'เบอร์โทร: $phoneNumber',
            style: GoogleFonts.poppins(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'ยกเลิก',
                style: GoogleFonts.poppins(color: Colors.red),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(context); // ปิดป๊อปอัปก่อน
                _makePhoneCall(phoneNumber); // โทรออก
              },
              child: Text(
                'โทร',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
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
        title: Text(
          'เบอร์ติดต่อฉุกเฉิน',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.orange,
        elevation: 0,
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
      color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color, size: 30),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () => _showCallPopup(context, title, phoneNumber), // แสดงป๊อปอัปก่อนโทร
          child: Text(
            'โทร',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        onTap: () => _showCallPopup(context, title, phoneNumber), // แสดงป๊อปอัปเมื่อกดที่การ์ด
      ),
    );
  }
}
