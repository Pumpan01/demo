import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  // ตัวอย่างข้อมูลการชำระเงิน
  double _outstandingBalance = 3200; // ยอดค้างชำระ (ตัวอย่าง)
  bool _isPaid = false; // สถานะการชำระเงิน

  void _pay() {
    // ฟังก์ชันเมื่อกดปุ่มชำระเงิน
    setState(() {
      _outstandingBalance = 0;
      _isPaid = true;
    });

    // แสดงข้อความเมื่อชำระเงินเสร็จ
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('ชำระเงินเรียบร้อยแล้ว')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('ยอดค้างชำระ / ชำระเงิน'),
        centerTitle: true,
      ),
      body: Center(  // ใช้ Center เพื่อให้ทุกอย่างอยู่ตรงกลาง
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  // จัดให้อยู่กึ่งกลางแนวตั้ง
            crossAxisAlignment: CrossAxisAlignment.center, // จัดให้อยู่กึ่งกลางแนวนอน
            children: [
              // แสดงรูป QR
              Image.asset(
                'images/QR.png', // ชื่อไฟล์ QR ในโฟลเดอร์ images
                height: 150, // กำหนดขนาดรูป
                width: 150,
              ),
              const SizedBox(height: 32), // เว้นระยะห่าง

              // แสดงสถานะการชำระเงิน
              if (!_isPaid)
                Column(
                  children: [
                    const Text(
                      'ยอดค้างชำระทั้งหมด',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '$_outstandingBalance บาท',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 32),
                    // ปุ่มชำระเงิน
                    ElevatedButton.icon(
                      onPressed: _pay, // เรียกใช้ฟังก์ชันชำระเงิน
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15, 
                          horizontal: 40,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      icon: const Icon(Icons.payment, color: Colors.white),
                      label: const Text(
                        'ชำระเงิน',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                )
              else
                // ข้อความแสดงเมื่อชำระเงินแล้ว
                const Text(
                  'ชำระเงินครบแล้ว',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
