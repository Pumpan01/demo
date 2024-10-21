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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ฟิลด์แก้ไขค่าห้อง
            const Text(
              'ค่าเช่าห้อง (บาท):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _roomPriceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'กรอกค่าเช่าห้อง',
              ),
            ),
            const SizedBox(height: 20),

            // ฟิลด์แก้ไขค่าน้ำ
            const Text(
              'ค่าน้ำ (หน่วย):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _waterPriceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'กรอกค่าน้ำ',
              ),
            ),
            const SizedBox(height: 20),

            // ฟิลด์แก้ไขค่าไฟ
            const Text(
              'ค่าไฟ (หน่วย):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _electricityPriceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'กรอกค่าไฟ',
              ),
            ),
            const SizedBox(height: 20),

            // ปุ่มอัพโหลดสลิป
            ElevatedButton(
              onPressed: _pickSlip,
              child: const Text('แนบสลิป'),
            ),
            const SizedBox(height: 10),

            // แสดงสถานะการแนบสลิป
            _slipPath != null
                ? Text('มีสลิปแนบแล้ว: $_slipPath')
                : const Text('ยังไม่มีสลิป'),

            const SizedBox(height: 20),

            // ปุ่มบันทึกการแก้ไข
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // บันทึกข้อมูลและส่งให้ลูกบ้าน
                  // คุณสามารถเชื่อมกับระบบ backend ที่นี่ได้
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('บันทึกข้อมูลเรียบร้อย')),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 80),
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('บันทึก', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
