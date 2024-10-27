import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditAnnouncementPage extends StatefulWidget {
  final int announcementId;
  final String announcementTitle;
  final String announcementDetail;

  const EditAnnouncementPage({
    super.key,
    required this.announcementId,
    required this.announcementTitle,
    required this.announcementDetail,
  });

  @override
  _EditAnnouncementPageState createState() => _EditAnnouncementPageState();
}

class _EditAnnouncementPageState extends State<EditAnnouncementPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _detailController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.announcementTitle);
    _detailController = TextEditingController(text: widget.announcementDetail);
  }

  void _saveEditedAnnouncement() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('บันทึกการแก้ไขประกาศเรียบร้อย')),
      );
      Navigator.pop(context); 
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'แก้ไขประกาศ',
          style: GoogleFonts.prompt(),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'แก้ไขประกาศ',
                  style: GoogleFonts.prompt(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // ช่องแก้ไขชื่อประกาศ
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'ชื่อประกาศ',
                    labelStyle: GoogleFonts.prompt(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกชื่อประกาศ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // ช่องแก้ไขรายละเอียดประกาศ
                TextFormField(
                  controller: _detailController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'รายละเอียดประกาศ',
                    labelStyle: GoogleFonts.prompt(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกรายละเอียดประกาศ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // ปุ่มบันทึกการแก้ไข
                Center(
                  child: ElevatedButton.icon(
                    onPressed: _saveEditedAnnouncement,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 40,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.orange,
                    ),
                    icon: const Icon(Icons.save, color: Colors.white),
                    label: Text(
                      'บันทึกการแก้ไข',
                      style: GoogleFonts.prompt(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
