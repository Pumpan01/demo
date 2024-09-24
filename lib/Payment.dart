import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สถานะการชำระเงิน'),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text(
          'ยอดค้างชำระ: 0 บาท\nสถานะการชำระเงิน: ชำระครบแล้ว',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
