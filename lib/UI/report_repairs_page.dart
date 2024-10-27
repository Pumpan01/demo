import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';

class ReportRepairsPage extends StatefulWidget {
  const ReportRepairsPage({super.key});

  @override
  _ReportRepairsPageState createState() => _ReportRepairsPageState();
}

class _ReportRepairsPageState extends State<ReportRepairsPage> {
  final TextEditingController _detailsController = TextEditingController();
  String _selectedCategory = 'แจ้งซ่อม';
  String _selectedRepairType = 'ไฟฟ้า';
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  Future<void> _showSuccessPopup(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Center(
            child: Text(
              'ส่งเรื่องเรียบร้อย',
              style: GoogleFonts.prompt(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
          content: const Text(
            'การแจ้งของคุณได้ถูกส่งเรียบร้อยแล้ว',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                child: Text(
                  'ตกลง',
                  style: GoogleFonts.prompt(color: Colors.orange),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _submitReport() {
    if (_detailsController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('กรุณากรอกรายละเอียดปัญหา')),
      );
    } else {
      _showSuccessPopup(context);
      _detailsController.clear();
      setState(() {
        _imageFile = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'แจ้งซ่อมและร้องเรียนปัญหา',
          style: GoogleFonts.prompt(),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildDropdown(
                label: 'ประเภทการแจ้ง',
                value: _selectedCategory,
                items: ['แจ้งซ่อม', 'ร้องเรียนปัญหา'],
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              if (_selectedCategory == 'แจ้งซ่อม') ...[
                const SizedBox(height: 20),
                _buildDropdown(
                  label: 'ประเภทการซ่อม',
                  value: _selectedRepairType,
                  items: ['ไฟฟ้า', 'ประปา', 'เครื่องใช้ไฟฟ้า', 'อื่นๆ'],
                  onChanged: (value) {
                    setState(() {
                      _selectedRepairType = value!;
                    });
                  },
                ),
              ],
              const SizedBox(height: 20),
              Text(
                'รายละเอียดปัญหา:',
                style: GoogleFonts.prompt(
                  textStyle: const TextStyle(fontSize: 18, color: Colors.orange),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _detailsController,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'กรอกรายละเอียดปัญหา...',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // ปุ่มแนบรูปภาพ
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(FontAwesomeIcons.paperclip, color: Colors.white),
                label: Text(
                  'แนบรูปภาพ',
                  style: GoogleFonts.prompt(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // แสดงชื่อไฟล์ที่แนบ (ถ้ามี)
              if (_imageFile != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'ไฟล์ที่แนบ: ${_imageFile!.name}',
                    style: GoogleFonts.prompt(
                      textStyle: const TextStyle(fontSize: 14, color: Colors.green),
                    ),
                  ),
                ),
              const SizedBox(height: 30), // เพิ่มระยะห่างระหว่างปุ่มแนบรูปและปุ่มส่งเรื่อง

              // ปุ่มส่งเรื่อง
              Center(
                child: ElevatedButton(
                  onPressed: _submitReport,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'ส่งเรื่อง',
                    style: GoogleFonts.prompt(
                      textStyle: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.prompt(
            textStyle: const TextStyle(fontSize: 18, color: Colors.orange),
          ),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: value,
          items: items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item, style: GoogleFonts.prompt()),
                  ))
              .toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
