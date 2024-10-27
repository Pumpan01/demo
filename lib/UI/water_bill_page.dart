import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';

class WaterBillPage extends StatefulWidget {
  const WaterBillPage({super.key});

  @override
  _WaterBillPageState createState() => _WaterBillPageState();
}

class _WaterBillPageState extends State<WaterBillPage> {
  XFile? _slipImage;
  final double roomCharge = 3000;
  final double waterCharge = 250;
  final double electricityCharge = 200;
  bool _showSlipLink = false;

  Future<void> _pickImage(StateSetter setState) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _slipImage = image;
      _showSlipLink = true;
    });
  }

  void _showPaymentPopup() {
    setState(() {
      _showSlipLink = false;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: Center(
                child: Text(
                  'สแกนและแนบสลิป',
                  style: GoogleFonts.prompt(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'images/QR.png', // ใช้เส้นทางนี้ตามที่ตั้งใน pubspec.yaml
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text('ไม่พบ QR Code');
                    },
                  ),
                  const SizedBox(height: 20),
                  _billDetailRow(
                      FontAwesomeIcons.water, 'ค่าน้ำ', '$waterCharge บาท'),
                  _billDetailRow(
                      FontAwesomeIcons.bolt, 'ค่าไฟ', '$electricityCharge บาท'),
                  _billDetailRow(
                      FontAwesomeIcons.house, 'ค่าห้อง', '$roomCharge บาท'),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => _pickImage(setState),
                    icon: const Icon(Icons.upload_file, color: Colors.white),
                    label: const Text('แนบสลิปการโอน',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  if (_slipImage != null && _showSlipLink)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'ไฟล์สลิปที่แนบ: ${_slipImage!.name}',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.green),
                      ),
                    ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_slipImage != null) {
                        Navigator.of(context).pop();
                        _sendSlipToAdmin();
                        setState(() {
                          _showSlipLink = false;
                        });
                        _showConfirmationPopup(success: true);
                      } else {
                        _showConfirmationPopup(success: false);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('ส่งสลิป',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child:
                      const Text('ปิด', style: TextStyle(color: Colors.orange)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _sendSlipToAdmin() {
    print("ส่งไฟล์ไปยังแอดมิน: ${_slipImage?.path}");
  }

  void _showConfirmationPopup({required bool success}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              Icon(success ? Icons.check_circle : Icons.error,
                  color: success ? Colors.green : Colors.red),
              const SizedBox(width: 10),
              Text(success ? 'สำเร็จ' : 'ไม่สำเร็จ',
                  style: GoogleFonts.prompt()),
            ],
          ),
          content: Text(
            success ? 'ส่งสลิปเรียบร้อย' : 'กรุณาแนบสลิปก่อนส่ง',
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('ตกลง', style: TextStyle(color: Colors.orange)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double totalCharge = roomCharge + waterCharge + electricityCharge;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text('รายละเอียดการชำระเงิน', style: GoogleFonts.prompt()),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.receipt_long,
                            color: Colors.orange, size: 30),
                        const SizedBox(width: 10),
                        Text(
                          'รายละเอียดบิล',
                          style: GoogleFonts.prompt(
                            textStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _billDetailRow(
                        FontAwesomeIcons.water, 'ค่าน้ำ', '$waterCharge บาท'),
                    _billDetailRow(FontAwesomeIcons.bolt, 'ค่าไฟ',
                        '$electricityCharge บาท'),
                    _billDetailRow(
                        FontAwesomeIcons.house, 'ค่าห้อง', '$roomCharge บาท'),
                    const Divider(color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ยอดรวมที่ต้องชำระ',
                          style: GoogleFonts.prompt(
                            textStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '$totalCharge บาท',
                          style: GoogleFonts.prompt(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _showPaymentPopup,
                icon: const Icon(Icons.payment, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                label: const Text(
                  'ชำระเงิน',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _billDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange, size: 20),
          const SizedBox(width: 10),
          Text(
            title,
            style: GoogleFonts.prompt(
              textStyle: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: GoogleFonts.prompt(
              textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
