import 'package:flutter/material.dart';

class PaymentHistoryPage extends StatelessWidget {
  // ข้อมูลประวัติการชำระเงินที่สมมุติขึ้น
  final List<Map<String, dynamic>> paymentHistory = [
    {
      'month': 'มกราคม 2024',
      'amount': 3200,
      'status': 'ชำระแล้ว',
    },
    {
      'month': 'กุมภาพันธ์ 2024',
      'amount': 3200,
      'status': 'ชำระแล้ว',
    },
    {
      'month': 'มีนาคม 2024',
      'amount': 3200,
      'status': 'ชำระแล้ว',
    },
  ];

  PaymentHistoryPage({super.key});  // ลบ const ออก

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ประวัติการชำระเงิน'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'รายการชำระเงิน:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: paymentHistory.length,
                itemBuilder: (context, index) {
                  final payment = paymentHistory[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'เดือน: ${payment['month']}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'จำนวนเงิน: ${payment['amount']} บาท',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  color: payment['status'] == 'ชำระแล้ว'
                                      ? Colors.green.withOpacity(0.1)
                                      : Colors.red.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  payment['status'],
                                  style: TextStyle(
                                    color: payment['status'] == 'ชำระแล้ว'
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
