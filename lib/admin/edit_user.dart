import 'package:flutter/material.dart';

class EditUserPage extends StatefulWidget {
  final String fullName;
  final String phoneNumber;
  final String roomNumber;
  final String monthlyRent;
  final String emergencyContact;
  final String lineId;

  const EditUserPage({
    Key? key,
    required this.fullName,
    required this.phoneNumber,
    required this.roomNumber,
    required this.monthlyRent,
    required this.emergencyContact,
    required this.lineId,
  }) : super(key: key);

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  late TextEditingController _fullNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _roomNumberController;
  late TextEditingController _monthlyRentController;
  late TextEditingController _emergencyContactController;
  late TextEditingController _lineIdController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: widget.fullName);
    _phoneNumberController = TextEditingController(text: widget.phoneNumber);
    _roomNumberController = TextEditingController(text: widget.roomNumber);
    _monthlyRentController = TextEditingController(text: widget.monthlyRent);
    _emergencyContactController = TextEditingController(text: widget.emergencyContact);
    _lineIdController = TextEditingController(text: widget.lineId);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _roomNumberController.dispose();
    _monthlyRentController.dispose();
    _emergencyContactController.dispose();
    _lineIdController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    // ฟังก์ชันบันทึกการแก้ไข
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('บันทึกการแก้ไขข้อมูลสำเร็จ')),
    );
    Navigator.pop(context); // กลับไปหน้าก่อนหน้า
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แก้ไขข้อมูลผู้เช่า'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'แก้ไขข้อมูลห้องพัก',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // แก้ไขชื่อเต็ม
              TextField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  labelText: 'ชื่อเต็ม',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // แก้ไขหมายเลขโทรศัพท์
              TextField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  labelText: 'หมายเลขโทรศัพท์',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // แก้ไขเลขห้อง
              TextField(
                controller: _roomNumberController,
                decoration: const InputDecoration(
                  labelText: 'เลขห้อง',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // แก้ไขค่าเช่ารายเดือน
              TextField(
                controller: _monthlyRentController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'ค่าเช่ารายเดือน (บาท)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // แก้ไขข้อมูลผู้ติดต่อฉุกเฉิน
              TextField(
                controller: _emergencyContactController,
                decoration: const InputDecoration(
                  labelText: 'ผู้ติดต่อฉุกเฉิน',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // แก้ไข Line ID
              TextField(
                controller: _lineIdController,
                decoration: const InputDecoration(
                  labelText: 'Line ID',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),

              // ปุ่มบันทึกการแก้ไข
              Center(
                child: ElevatedButton(
                  onPressed: _saveChanges,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 40,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'บันทึกการแก้ไข',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
