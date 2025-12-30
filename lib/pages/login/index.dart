import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_shop/api/user.dart';
import 'package:flutter_learn_shop/stores/tokenManager.dart';
import 'package:flutter_learn_shop/stores/userController.dart';
import 'package:flutter_learn_shop/utils/loadingDialog.dart';
import 'package:flutter_learn_shop/utils/toast.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final UserController _userController = Get.find();

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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "密码不能为空";
        }
        if (!RegExp(r"[a-z0-9_]{6,16}$").hasMatch(value)) {
          return "请输入6-16位字母、数字或下划线组成的密码";
        }
        return null;
      },
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
                text: "《用户协议》",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _login() async {
    _isLoading = true;
    LoadingDialog.show(context, message: "登录中...");

    try {
      final res = await loginApi({
        "account": _phoneController.text,
        "password": _passwordController.text,
      });
      _userController.updateUserInto(res);
      tokenManager.setToken(res.token);
      Toast.showToast(context, "登录成功");
      Navigator.pop(context);
    } catch (e) {
      Toast.showToast(context, (e as DioException).message ?? "登录失败");
    } finally {
      _isLoading = false;
      LoadingDialog.hide(context);
    }
  }

  Widget _loginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isLoading
            ? null
            : () {
                if (_globalKey.currentState!.validate()) {
                  if (_isChecked) {
                    _login();
                  } else {
                    Toast.showToast(context, "请先同意隐私条款和用户协议");
                  }
                }
              },
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
