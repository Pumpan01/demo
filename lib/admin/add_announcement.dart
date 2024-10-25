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
      // สมมุติว่าประกาศถูกบันทึกแล้ว (ในอนาคตสามารถเชื่อมต่อกับ API ได้)
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
        backgroundColor: Colors.orange,
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
                  style: TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 20),
                
                // ช่องกรอกชื่อประกาศ
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'ชื่อประกาศ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // โค้งมน
                    ),
                    filled: true,
                    fillColor: Colors.grey[200], // พื้นหลังสีเทาอ่อน
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
                  decoration: InputDecoration(
                    labelText: 'รายละเอียดประกาศ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // โค้งมน
                    ),
                    filled: true,
                    fillColor: Colors.grey[200], // พื้นหลังสีเทาอ่อน
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกรายละเอียดประกาศ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // ปุ่มบันทึกประกาศ
                Center(
                  child: ElevatedButton.icon(
                    onPressed: _saveAnnouncement,
                    icon: const Icon(Icons.save, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // สีส้มสำหรับปุ่ม
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 40,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // โค้งมน
                      ),
                      elevation: 5, // เพิ่มเงาให้ปุ่มดูเด่นขึ้น
                    ),
                    label: const Text(
                      'บันทึกประกาศ',
                      style: TextStyle(fontSize: 18, color: Colors.white),
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
