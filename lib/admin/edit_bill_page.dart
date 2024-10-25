import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditBillPage extends StatefulWidget {
  final int roomNumber;

  const EditBillPage({super.key, required this.roomNumber});

  @override
  _EditBillPageState createState() => _EditBillPageState();
}

class _EditBillPageState extends State<EditBillPage> {
  final TextEditingController _roomPriceController = TextEditingController();
  final TextEditingController _waterPriceController = TextEditingController();
  final TextEditingController _electricityPriceController =
      TextEditingController();
  String? _slipPath; // เก็บ path ของสลิปการชำระเงิน

  // ฟังก์ชันเลือกไฟล์สลิป
  Future<void> _pickSlip() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _slipPath = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไขบิลห้อง ${widget.roomNumber}'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ค่าเช่าห้อง (บาท):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _roomPriceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'กรอกค่าเช่าห้อง',
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'ค่าน้ำ (หน่วย):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _waterPriceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'กรอกค่าน้ำ',
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'ค่าไฟ (หน่วย):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _electricityPriceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'กรอกค่าไฟ',
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 20),

              // ปุ่มอัพโหลดสลิป
              Center(
                child: ElevatedButton.icon(
                  onPressed: _pickSlip,
                  icon: const Icon(Icons.upload_file,
                      color: Colors.white), // ไอคอนสีขาว
                  label: const Text(
                    'แนบรูป',
                    style: TextStyle(color: Colors.white), // ตัวหนังสือสีขาว
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // แสดงสถานะการแนบสลิป
              _slipPath != null
                  ? Text(
                      'มีสลิปแนบแล้ว: $_slipPath',
                      style: const TextStyle(fontSize: 16, color: Colors.green),
                    )
                  : const Text(
                      'ยังไม่มีสลิป',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
              const SizedBox(height: 20),

              // ปุ่มบันทึกการแก้ไข
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // บันทึกข้อมูลและส่งให้ลูกบ้าน
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('บันทึกข้อมูลเรียบร้อย')),
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'บันทึก',
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
