import 'package:flutter/material.dart';
import 'add_announcement.dart';
import 'edit_announcement.dart';

class ManageAnnouncementsPage extends StatefulWidget {
  const ManageAnnouncementsPage({super.key});

  @override
  _ManageAnnouncementsPageState createState() =>
      _ManageAnnouncementsPageState();
}

class _ManageAnnouncementsPageState extends State<ManageAnnouncementsPage> {
  // ตัวอย่างรายการประกาศแบบจำลอง (สามารถเชื่อมต่อกับ API หรือฐานข้อมูลได้ในอนาคต)
  List<Map<String, String>> announcements = [
    {'title': 'ประกาศที่ 1', 'detail': 'วันที่ 1 มีนาคม 2565 น้ำไม่ไหล'},
    {'title': 'ประกาศที่ 2', 'detail': 'วันที่ 2 มีนาคม 2565 ไฟฟ้าใช้งานไม่ได้'},
    {'title': 'ประกาศที่ 3', 'detail': 'วันที่ 3 มีนาคม 2565 ซ่อมบํารุงตึก3'},
    {'title': 'ประกาศที่ 4', 'detail': 'วันที่ 4 มีนาคม 2565 ทำความสะอาดตึก1'},
    {'title': 'ประกาศที่ 5', 'detail': 'วันที่ 5 มีนาคม 2565 ซ่อมไฟฟ้าตึก2'},
  ];

  // ฟังก์ชันลบประกาศ
  void _deleteAnnouncement(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ยืนยันการลบ'),
          content: const Text('คุณต้องการลบประกาศนี้หรือไม่?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // ปิด dialog ถ้าไม่ต้องการลบ
              },
              child: const Text('ยกเลิก'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  announcements.removeAt(index); // ลบประกาศตาม index
                });
                Navigator.pop(context); // ปิด dialog หลังจากลบสำเร็จ
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('ลบประกาศเรียบร้อย')),
                );
              },
              child: const Text('ลบ'),
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
        title: const Text('จัดการประกาศ'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ประกาศปัจจุบัน',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: announcements.length, // ใช้จำนวนประกาศจากรายการจำลอง
                itemBuilder: (context, index) {
                  return _buildAnnouncementCard(context, index);
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddAnnouncementPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.add, color: Colors.white), // ไอคอนสีขาว
                label: const Text(
                  'เพิ่มประกาศใหม่',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // ตัวอักษรสีขาว
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // ปรับขอบโค้งมน
                  ),
                  backgroundColor: Colors.orange, // พื้นหลังสีส้ม
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ฟังก์ชันสำหรับสร้าง Card ของแต่ละประกาศ
  Widget _buildAnnouncementCard(BuildContext context, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
          title: Text(
            announcements[index]['title']!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              announcements[index]['detail']!,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlinedButton(
                onPressed: () {
                  // นำไปหน้าแก้ไขประกาศ
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditAnnouncementPage(
                        announcementId: index + 1,
                        announcementTitle: announcements[index]['title']!,
                        announcementDetail: announcements[index]['detail']!,
                      ),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: const BorderSide(color: Colors.orange),
                ),
                child: const Text(
                  'แก้ไข',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  _deleteAnnouncement(index); // ฟังก์ชันลบประกาศ
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
