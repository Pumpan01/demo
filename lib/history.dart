import 'package:flutter/material.dart';

class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ประวัติการชำระเงิน'),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text(
          'วันที่ชำระ: 01/09/2024\nจำนวนเงิน: 3200 บาท\nช่องทาง: โอนผ่านธนาคาร',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
