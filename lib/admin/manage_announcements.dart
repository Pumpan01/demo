import 'package:flutter/material.dart';
import 'edit_announcement.dart'; // นำเข้าไฟล์ edit_announcement.dart
import 'add_announcement.dart';

class ManageAnnouncementsPage extends StatefulWidget {
  const ManageAnnouncementsPage({super.key});

  @override
  _ManageAnnouncementsPageState createState() =>
      _ManageAnnouncementsPageState();
}

class _ManageAnnouncementsPageState extends State<ManageAnnouncementsPage> {
  // ตัวอย่างรายการประกาศแบบจำลอง (สามารถเชื่อมต่อกับ API หรือฐานข้อมูลได้ในอนาคต)
  List<Map<String, String>> announcements = [
    {'title': 'ประกาศที่ 1', 'detail': 'รายละเอียดของประกาศ 1'},
    {'title': 'ประกาศที่ 2', 'detail': 'รายละเอียดของประกาศ 2'},
    {'title': 'ประกาศที่ 3', 'detail': 'รายละเอียดของประกาศ 3'},
    {'title': 'ประกาศที่ 4', 'detail': 'รายละเอียดของประกาศ 4'},
    {'title': 'ประกาศที่ 5', 'detail': 'รายละเอียดของประกาศ 5'},
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ประกาศปัจจุบัน',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: announcements.length, // ใช้จำนวนประกาศจากรายการจำลอง
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(announcements[index]['title']!),
                      subtitle: Text(announcements[index]['detail']!),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // นำไปหน้าแก้ไขประกาศ
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditAnnouncementPage(
                                    announcementId: index + 1,
                                    announcementTitle: announcements[index]
                                        ['title']!,
                                    announcementDetail: announcements[index]
                                        ['detail']!,
                                  ),
                                ),
                              );
                            },
                            child: const Text('แก้ไข'),
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
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddAnnouncementPage(),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('เพิ่มประกาศใหม่'),
            )
          ],
        ),
      ),
    );
  }
}
