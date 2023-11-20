import 'package:flutter/material.dart';

class AddAddressPage extends StatefulWidget {
  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('添加收货地址'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildTextField('收件人姓名', _nameController),
              buildTextField('街道地址', _streetController),
              buildTextField('城市', _cityController),
              buildTextField('邮政编码', _zipCodeController),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // 表单验证通过，可以保存收货地址
                    final newAddress = Address(
                      name: _nameController.text,
                      street: _streetController.text,
                      city: _cityController.text,
                      zipCode: _zipCodeController.text,
                    );

                    // 在这里执行保存操作，例如将新地址添加到数据库或其他存储中

                    // 返回上一页
                    Navigator.pop(context, newAddress);
                  }
                },
                child: Text('保存'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 120, // 调整宽度以适应您的需求
            child: Text(
              label,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none, // 移除边框
              ),
              validator: (value) {
                return null; // 移除验证
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Address {
  final String name;
  final String street;
  final String city;
  final String zipCode;

  Address({
    required this.name,
    required this.street,
    required this.city,
    required this.zipCode,
  });
}
