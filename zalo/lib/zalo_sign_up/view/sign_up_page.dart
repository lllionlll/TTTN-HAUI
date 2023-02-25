import 'package:flutter/material.dart';
import 'package:zalo/common/show_toast.dart';
import 'package:zalo/repository/repository.dart';
import 'package:zalo/zalo_home/view/zalo_home_page.dart';
import 'package:zalo/zalo_intro/view/intro_page.dart';
import 'package:zalo/constants/constants.dart';

import '../../common/navigate.dart';

class SignUpPage extends StatefulWidget {

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('Tạo tài khoản'),
          elevation: 0.4,
          centerTitle: true,
          excludeHeaderSemantics: false,
          leading: GestureDetector(
            onTap: () => navigate(context, IntroPage()),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          // color: Colors.red,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: size.width,
                    padding: EdgeInsets.all(16),
                    child: Text(
                        'Vui lòng nhập thông tin để tạo tài khoản!'
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextField(
                      controller: email,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'Email'
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextField(
                      controller: password,
                      obscureText: isHidden,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Mật khẩu',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },
                          child: isHidden
                              ? Icon(Icons.remove_red_eye)
                              : Icon(Icons.remove_red_eye_outlined),
                        )
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextField(
                      controller: confirmPassword,
                      obscureText: isHidden,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Nhập lại khẩu',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },
                          child: isHidden
                              ? Icon(Icons.remove_red_eye)
                              : Icon(Icons.remove_red_eye_outlined),
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () async {
            if (email.text.trim().isEmpty ||
                password.text.trim().isEmpty ||
                confirmPassword.text.trim().isEmpty
            ) {
              showToast('Vui lòng nhập đầy đủ thông tin!', context);
              return;
            }
            if (password.text.trim() != confirmPassword.text.trim()){
              showToast('Mật khẩu không giống nhau!', context);
              return;
            }
            String msg = await Repository.createUser(
              emailAddress: email.text.trim(),
              password: password.text.trim()
            );
            showToast(msg, context);
            if (msg == Constants.CREAT_SUCCESS) {
              navigate(context, HomePage());
            }
          },
          child: Container(
            padding: EdgeInsets.all(16),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 24,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
