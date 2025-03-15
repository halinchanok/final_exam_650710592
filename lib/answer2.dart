import 'package:flutter/material.dart';

class Answer2 extends StatefulWidget {
  const Answer2({super.key});

  @override
  State<Answer2> createState() => _Answer2State();
}

class _Answer2State extends State<Answer2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _weight = TextEditingController();
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  String? _selectedItem;
  String? _radio = '0';
  int _total = 0;
  int ch = 0;

  int _showPrice() {
    _total = 0;
    if (_isChecked1 == true) {
      _total += 20;
    }
    if (_isChecked2 == true) {
      _total += 50;
    }

    if (ch == 2) {
      _total = 30;
    } else if (ch == 3) {
      _total += 50;
    }
    return _total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("คำนวณการจัดส่ง")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: _weight,
                decoration: InputDecoration(
                  labelText:
                      'น้ำหนักสินค้า (กก.):', // ข้อกดที่กล่อง Name จะไม่ขยับ
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกข้อมูลให้ครบ!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text("เลือกระยะทาง:"),

              // DropDown
              DropdownButtonFormField<String>(
                value: _selectedItem,
                items:
                    ['Option 1', 'Option 2', 'Option 3']
                        .map(
                          (String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ),
                        )
                        .toList(), // แปลง List<String> เป็น List<DropdownMenuItem<String>>,
                onChanged: (value) {
                  _total += 0;
                  _selectedItem = value;
                },
              ),

              // Checkbox
              SizedBox(height: 20),
              Text("บริการเสริม:"),
              CheckboxListTile(
                title: Text('แพ็คกิ้งพิเศษ (+20 บาท)'),
                value: _isChecked1,
                onChanged: (value) {
                  setState(() {
                    _isChecked1 = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('ประกันพัสดุ (+50 บาท)'),
                value: _isChecked2,
                onChanged: (value) {
                  setState(() {
                    _isChecked2 = value!;
                  });
                },
              ),

              // Radio
              Text("เลือกความเร่งด่วน:"),
              RadioListTile(
                title: const Text('ปกติ'),
                value: 'ปกติ',
                groupValue: _radio,
                onChanged: (value) {
                  setState(() {
                    ch = 1;
                    _radio = '1';
                  });
                },
              ),
              RadioListTile(
                title: const Text('ด่วน'),
                value: 'ด่วน',
                groupValue: _radio,
                onChanged: (value) {
                  setState(() {
                    ch = 2;
                    _radio = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text('ด่วนพิเศษ'),
                value: 'ด่วนพิเศษ',
                groupValue: _radio,
                onChanged: (value) {
                  setState(() {
                    ch = 3;
                    _radio = value.toString();
                  });
                },
              ),

              // Submit
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _showPrice();
                    }
                  },
                  child: Text('คำนวณราคา'),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Container(
                  width: 300,
                  height: 50,
                  color: Colors.blue,
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          "ค่าจัดส่งทั้งหมด: ฿$_total",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
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
}
