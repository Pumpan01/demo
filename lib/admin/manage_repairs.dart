import 'package:flutter/material.dart';

class ManageRepairsPage extends StatelessWidget {
  const ManageRepairsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('จัดการการแจ้งซ่อม'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'รายการแจ้งซ่อม',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,  // จำนวนรายการซ่อม (สามารถเชื่อมต่อกับ backend ได้)
                itemBuilder: (context, index) {
                  return RepairCard(repairId: index + 1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RepairCard extends StatefulWidget {
  final int repairId;

  const RepairCard({Key? key, required this.repairId}) : super(key: key);

  @override
  _RepairCardState createState() => _RepairCardState();
}

class _RepairCardState extends State<RepairCard> {
  bool _isReceived = false; // สถานะการรับเรื่องซ่อม

  void _receiveRepair() {
    setState(() {
      _isReceived = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('รับเรื่องซ่อมหมายเลข ${widget.repairId} แล้ว')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('รายการซ่อมที่ ${widget.repairId}'),
        subtitle: const Text('รายละเอียด: ห้องน้ำรั่ว'),
        trailing: ElevatedButton(
          onPressed: _isReceived ? null : _receiveRepair,
          style: ElevatedButton.styleFrom(
            backgroundColor: _isReceived ? Colors.grey : const Color.fromARGB(255, 255, 255, 255), // เปลี่ยนสีปุ่มเมื่อรับเรื่องแล้ว
          ),
          child: Text(_isReceived ? 'รับเรื่องแล้ว' : 'รับเรื่อง'),
        ),
      ),
    );
  }
}
