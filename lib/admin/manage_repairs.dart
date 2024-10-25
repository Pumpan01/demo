import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // นำเข้า intl สำหรับจัดการวันที่

class ManageRepairsPage extends StatelessWidget {
  const ManageRepairsPage({super.key});

  final List<Map<String, dynamic>> mockRepairs = const [
    {'roomNumber': 101, 'details': 'ห้องน้ำรั่ว'},
    {'roomNumber': 102, 'details': 'หลอดไฟเสีย'},
    {'roomNumber': 103, 'details': 'แอร์ไม่เย็น'},
    {'roomNumber': 104, 'details': 'น้ำไม่ไหล'},
    {'roomNumber': 105, 'details': 'ประตูล็อกไม่ได้'},
    {'roomNumber': 106, 'details': 'เครื่องทำน้ำอุ่นเสีย'},
    {'roomNumber': 107, 'details': 'ปลั๊กไฟไม่ทำงาน'},
    {'roomNumber': 108, 'details': 'พื้นห้องน้ำร้าว'},
    {'roomNumber': 109, 'details': 'ท่อน้ำอุดตัน'},
    {'roomNumber': 110, 'details': 'กระจกแตก'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('จัดการการแจ้งซ่อม'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'รายการแจ้งซ่อม',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: mockRepairs.length, // จำนวนรายการซ่อม
                itemBuilder: (context, index) {
                  return RepairCard(
                    roomNumber: mockRepairs[index]['roomNumber'],
                    details: mockRepairs[index]['details'],
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

class RepairCard extends StatefulWidget {
  final int roomNumber;
  final String details;

  const RepairCard({
    super.key, // ใช้ super.key แทน
    required this.roomNumber,
    required this.details,
  });

  @override
  _RepairCardState createState() => _RepairCardState();
}

class _RepairCardState extends State<RepairCard> {
  bool _isReceived = false; // สถานะการรับเรื่องซ่อม
  String? _selectedDate; // วันที่ตอบกลับว่าจะไปซ่อม

  // ฟังก์ชันรับเรื่องซ่อม
  void _receiveRepair() {
    setState(() {
      _isReceived = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('รับเรื่องซ่อมห้อง ${widget.roomNumber} แล้ว')),
    );
  }

  // ฟังก์ชันสำหรับเลือกวันที่
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('คุณได้เลือกวันที่ ${_selectedDate!} สำหรับการซ่อม')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.orange.shade100,
                child: Text(
                  widget.roomNumber.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                    fontSize: 18,
                  ),
                ),
              ),
              title: Text(
                'ห้อง ${widget.roomNumber}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                widget.details,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              trailing: ElevatedButton(
                onPressed: _isReceived ? null : _receiveRepair,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isReceived ? Colors.grey : Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  _isReceived ? 'รับเรื่องแล้ว' : 'รับเรื่อง',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            if (_isReceived) ...[
              const SizedBox(height: 10),
              Text(
                _selectedDate != null
                    ? 'วันที่จะไปซ่อม: $_selectedDate'
                    : 'ยังไม่ได้ระบุวันที่จะไปซ่อม',
                style: const TextStyle(fontSize: 16, color: Colors.blueGrey),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'เลือกวันที่จะไปซ่อม',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
