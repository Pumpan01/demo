import 'package:flutter/material.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({super.key});

  @override
  _PaymentHistoryPageState createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  // ตัวอย่างข้อมูลการชำระเงิน
  final List<Map<String, dynamic>> _paymentHistory = [
    {
      'status': 'ชำระเงินแล้ว',
      'date': '01/09/2024',
      'amount': '3200',
    },
    {
      'status': 'ชำระเงินแล้ว',
      'date': '15/08/2024',
      'amount': '500',
    },
    {
      'status': 'ชำระเงินแล้ว',
      'date': '01/08/2024',
      'amount': '3200',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('ประวัติการชำระเงิน'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _paymentHistory.length,
          itemBuilder: (context, index) {
            final payment = _paymentHistory[index];

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Icon สถานะชำระเงิน
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.greenAccent,
                      child: Icon(Icons.check, color: Colors.white, size: 30),
                    ),
                    const SizedBox(width: 16),
                    
                    // ข้อมูลการชำระเงิน (สถานะการชำระเงิน และวันที่)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            payment['status'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'วันที่ชำระ: ${payment['date']}',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),

                    // จำนวนเงิน
                    Text(
                      '${payment['amount']} บาท',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
