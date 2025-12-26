import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool _isChecked = false;

  Widget _header() {
    return Text(
      "手机号及密码登录",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _phoneInput() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "手机号不能为空";
        }
        //校验手机号格式
        if (!RegExp(r"1[3-9]\d{9}$").hasMatch(value)) {
          return "手机号格式不正确，请重新输入";
        }
        return null;
      },
      controller: _phoneController,
      decoration: InputDecoration(
        labelText: "请输入手机号",
        labelStyle: TextStyle(fontSize: 14),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _passwordInput() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "请输入密码",
        labelStyle: TextStyle(fontSize: 14),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _checkBox() {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          activeColor: Colors.black,
          checkColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onChanged: (value) {
            _isChecked = value ?? false;
            setState(() {});
          },
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "查看并同意"),
              TextSpan(
                text: "《隐私条款》",
                style: TextStyle(color: Colors.blue),
              ),
              TextSpan(text: "和"),
              TextSpan(
                text: "用户协议",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isLoading ? null : () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 20),
        ),
        child: Text("登录", style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("登录"), centerTitle: true),
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              SizedBox(height: 20),
              _phoneInput(),
              SizedBox(height: 20),
              _passwordInput(),
              SizedBox(height: 20),
              _checkBox(),
              SizedBox(height: 20),
              _loginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
