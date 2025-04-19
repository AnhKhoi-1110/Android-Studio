import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username hoặc Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập username hoặc email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login(context, _usernameController.text, _passwordController.text);
                  }
                },
                child: Text('Đăng nhập'),
              ),
              SizedBox(height: 16.0),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to registration screen
                  print('Chuyển đến màn hình đăng ký');
                },
                child: Text('Chưa có tài khoản? Đăng ký ngay'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context, String username, String password) {
    // TODO: Implement your authentication logic here
    print('Đang cố gắng đăng nhập với: $username, $password');

    // **Ví dụ đơn giản (KHÔNG AN TOÀN CHO ỨNG DỤNG THỰC TẾ)**
    if (username == 'test' && password == '123') {
      // Đăng nhập thành công
      Navigator.pushReplacementNamed(context, '/note_list'); // Chuyển đến màn hình danh sách note
      // TODO: Lưu trạng thái đăng nhập của người dùng (ví dụ: sử dụng shared_preferences)
    } else {
      setState(() {
        _errorMessage = 'Sai tên đăng nhập hoặc mật khẩu';
      });
    }
  }
}