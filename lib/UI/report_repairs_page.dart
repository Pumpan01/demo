import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // สำหรับการเลือกภาพจากอุปกรณ์
import 'dart:io'; // สำหรับการใช้งานไฟล์

class ReportRepairsPage extends StatefulWidget {
  const ReportRepairsPage({super.key});

  @override
  _ReportRepairsPageState createState() => _ReportRepairsPageState();
}

class _ReportRepairsPageState extends State<ReportRepairsPage> {
  final TextEditingController _detailsController = TextEditingController();
  String _selectedCategory = 'แจ้งซ่อม'; // ค่าเริ่มต้นของประเภทการแจ้ง
  String _selectedRepairType = 'ไฟฟ้า'; // ค่าเริ่มต้นของประเภทการซ่อม
  XFile? _imageFile; // สำหรับเก็บไฟล์ภาพที่แนบ
  final ImagePicker _picker = ImagePicker();

  // ฟังก์ชันเลือกภาพจาก Gallery
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  // ฟังก์ชันแสดง Popup เมื่อส่งแจ้งซ่อมหรือร้องเรียนสำเร็จ
  Future<void> _showSuccessPopup(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // ห้ามปิด Popup โดยการคลิกข้างนอก
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ส่งเรื่องเรียบร้อย'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('การแจ้งของคุณได้ถูกส่งเรียบร้อยแล้ว'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ตกลง'),
              onPressed: () {
                Navigator.of(context).pop(); // ปิด Popup
              },
            ),
          ],
        );
      },
    );
  }

  // ฟังก์ชันส่งเรื่องแจ้งซ่อมหรือร้องเรียน
  void _submitReport() {
    if (_detailsController.text.isEmpty) {
      // ถ้ารายละเอียดว่าง ให้แสดงการแจ้งเตือน
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('กรุณากรอกรายละเอียดปัญหา')),
      );
    } else {
      // แสดง Popup แจ้งเตือนสำเร็จ
      _showSuccessPopup(context);

      // ล้างข้อมูลฟอร์มหลังจากการส่ง
      _detailsController.clear();
      setState(() {
        _imageFile = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แจ้งซ่อมและร้องเรียนปัญหา'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ประเภทการแจ้ง:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),

              // Dropdown สำหรับเลือกประเภทการแจ้ง (แจ้งซ่อม / ร้องเรียนปัญหา)
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                items: ['แจ้งซ่อม', 'ร้องเรียนปัญหา']
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
              const SizedBox(height: 20),

              // Dropdown สำหรับเลือกประเภทการซ่อม (เมื่อเลือก "แจ้งซ่อม")
              if (_selectedCategory == 'แจ้งซ่อม') ...[
                const Text(
                  'ประเภทการซ่อม:',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _selectedRepairType,
                  items: ['ไฟฟ้า', 'ประปา', 'เครื่องใช้ไฟฟ้า', 'อื่นๆ']
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedRepairType = value!;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // ช่องกรอกรายละเอียดปัญหา
              const Text(
                'รายละเอียดปัญหา:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _detailsController,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'กรอกรายละเอียดปัญหา...',
                ),
              ),
              const SizedBox(height: 20),

              // ปุ่มแนบรูปภาพ
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.camera_alt, color: Colors.white),
                label: const Text(
                  'แนบรูปภาพ',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,  // สีพื้นหลังของปุ่มเป็นสีส้ม
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // แสดงรูปภาพที่แนบ (ถ้ามี)
              if (_imageFile != null)
                Column(
                  children: [
                    const Text('รูปภาพที่แนบ:'),
                    const SizedBox(height: 10),
                    Image.file(
                      File(_imageFile!.path),
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),

              // ปุ่มส่งเรื่องแจ้งซ่อมหรือร้องเรียน
              Center(
                child: ElevatedButton(
                  onPressed: _submitReport,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'ส่งเรื่อง',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
