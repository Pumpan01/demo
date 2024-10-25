import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // สำหรับการเลือกภาพจากอุปกรณ์
import 'dart:io'; // สำหรับการใช้งานไฟล์

class WaterBillPage extends StatefulWidget {
  const WaterBillPage({super.key});

  @override
  _WaterBillPageState createState() => _WaterBillPageState();
}

class _WaterBillPageState extends State<WaterBillPage> {
  XFile? _slipImage; // ตัวแปรเก็บรูปสลิปที่แนบ

  // ฟังก์ชันเลือกภาพจาก Gallery
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _slipImage = image;
    });
  }

  // ฟังก์ชันส่งสลิป
  void _sendSlip() {
    if (_slipImage != null) {
      // แสดง Popup ว่าส่งสลิปสำเร็จ
      _showAlertDialog('สำเร็จ', 'ส่งสลิปเรียบร้อย', Icons.check_circle);

      // ล้างข้อมูลรูปสลิปที่แนบไว้
      setState(() {
        _slipImage = null; // ทำให้รูปหายไปหลังจากกดส่ง
      });
    } else {
      // ถ้าไม่มีรูป ให้แสดงข้อความเตือนเป็น Popup
      _showAlertDialog(
          'ข้อผิดพลาด', 'กรุณาแนบสลิปก่อนส่ง', Icons.error_outline);
    }
  }

  // ฟังก์ชันแสดง AlertDialog พร้อมตกแต่ง
  Future<void> _showAlertDialog(
      String title, String message, IconData icon) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // มุมโค้งมน
          ),
          title: Row(
            children: [
              Icon(icon, color: Colors.orange), // ใส่ไอคอนแจ้งเตือน
              const SizedBox(width: 10),
              Text(title),
            ],
          ),
          content: Text(message, style: const TextStyle(fontSize: 16)),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'ตกลง',
                style: TextStyle(fontSize: 18, color: Colors.orange),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
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
        title: const Text('บิลค่าน้ำค่าไฟ'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        // ใช้ Center widget เพื่อให้ทุกอย่างอยู่กึ่งกลางแนวตั้ง-แนวนอน
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // จัดให้อยู่ตรงกลางแนวตั้ง
              crossAxisAlignment:
                  CrossAxisAlignment.center, // จัดให้อยู่ตรงกลางแนวนอน
              children: [
                // การ์ดสำหรับแสดงข้อมูลบิล
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'รายละเอียดบิลค่าน้ำค่าไฟ',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // แสดงค่าน้ำและค่าไฟ (ข้อมูลสมมุติ)
                        const Text(
                          'ค่าน้ำ: 25 หน่วย (250 บาท)',
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'ค่าไฟ: 40 หน่วย (200 บาท)',
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                        ),
                        const SizedBox(height: 10),

                        // สมมุติยอดรวมที่ต้องชำระ
                        const Text(
                          'ยอดรวมที่ต้องชำระ: 450 บาท',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // QR Code สำหรับการสแกนจ่าย
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: _buildQrImage(), // ฟังก์ชันแสดงภาพ QR
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // ปุ่มเลือกแนบสลิป
                ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.upload_file,
                      color: Colors.white), // ไอคอนสีขาว
                  label: const Text(
                    'แนบสลิปการโอน',
                    style: TextStyle(color: Colors.white), // ตัวหนังสือสีขาว
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // พื้นหลังสีส้ม
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // แสดงภาพสลิปที่แนบ (ถ้ามี)
                if (_slipImage != null)
                  Column(
                    children: [
                      const Text(
                        'สลิปที่แนบ:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            File(_slipImage!.path),
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),

                // ปุ่มส่งสลิป
                ElevatedButton(
                  onPressed:
                      _sendSlip, // ใช้ฟังก์ชัน _sendSlip เพื่อส่งสลิปและแสดงแจ้งเตือน
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'ส่งสลิป',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันสร้างภาพ QR Code
  Widget _buildQrImage() {
    return Image.asset(
      'images/QR.png', // ใช้ชื่อไฟล์ QR.png ที่คุณมีในโฟลเดอร์ images
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return const Center(
          child: Text(
            'ไม่พบ QR Code',
            style: TextStyle(color: Colors.red),
          ),
        );
      },
    );
  }
}
