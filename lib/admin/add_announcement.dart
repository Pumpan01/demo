import 'package:flutter/material.dart';

class AddAnnouncementPage extends StatefulWidget {
  const AddAnnouncementPage({super.key});

  @override
  _AddAnnouncementPageState createState() => _AddAnnouncementPageState();
}

class _AddAnnouncementPageState extends State<AddAnnouncementPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();

  // ฟังก์ชันสำหรับบันทึกประกาศใหม่
  void _saveAnnouncement() {
    if (_formKey.currentState!.validate()) {
      // คุณสามารถเชื่อมต่อกับ API เพื่อบันทึกประกาศได้ที่นี่
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('บันทึกประกาศเรียบร้อย')),
      );
      Navigator.pop(context); // กลับไปหน้าก่อนหน้า
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มประกาศใหม่'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'สร้างประกาศใหม่',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                
                // ช่องกรอกชื่อประกาศ
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'ชื่อประกาศ',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกชื่อประกาศ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // ช่องกรอกรายละเอียดประกาศ
                TextFormField(
                  controller: _detailController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'รายละเอียดประกาศ',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกรายละเอียดประกาศ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // ปุ่มบันทึก
                Center(
                  child: ElevatedButton(
                    onPressed: _saveAnnouncement,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 40,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'บันทึกประกาศ',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
