import 'package:flutter/material.dart';

class EditAnnouncementPage extends StatefulWidget {
  final int announcementId;
  final String announcementTitle;
  final String announcementDetail;

  const EditAnnouncementPage({
    Key? key,
    required this.announcementId,
    required this.announcementTitle,
    required this.announcementDetail,
  }) : super(key: key);

  @override
  _EditAnnouncementPageState createState() => _EditAnnouncementPageState();
}

class _EditAnnouncementPageState extends State<EditAnnouncementPage> {
  late TextEditingController _titleController;
  late TextEditingController _detailController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.announcementTitle);
    _detailController = TextEditingController(text: widget.announcementDetail);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _detailController.dispose();
    super.dispose();
  }

  void _saveAnnouncement() {
    // ฟังก์ชันบันทึกการเปลี่ยนแปลง
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('บันทึกการแก้ไขสำหรับ "${_titleController.text}"')),
    );
    Navigator.pop(context); // กลับไปหน้าก่อนหน้า
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไขประกาศที่ ${widget.announcementId}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'แก้ไขประกาศ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // ช่องแก้ไขชื่อประกาศ
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'ชื่อประกาศ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // ช่องแก้ไขรายละเอียดประกาศ
            TextField(
              controller: _detailController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'รายละเอียดประกาศ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // ปุ่มบันทึกการแก้ไข
            Center(
              child: ElevatedButton(
                onPressed: _saveAnnouncement,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'บันทึกการแก้ไข',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
