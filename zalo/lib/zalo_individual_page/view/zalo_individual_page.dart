import 'package:flutter/material.dart';
import 'package:zalo/repository/repository.dart';
import 'package:zalo/common/navigate.dart';
import 'package:zalo/zalo_intro/view/intro_page.dart';

class IndividualPage extends StatelessWidget {
  const IndividualPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Column(
        children: [
          item(
              size,
              'Nguyễn Hoàng Lâm',
              'Xem trang cá nhân',
            'https://xettuyen.haui.edu.vn/assets/img/Haui-logo.jpg',
          ),
          SizedBox(height: 8,),
          item(
            size,
            'Ví QR',
            'Lưu trữ và xuất trình các mã QR quan trọng',
            'https://qrcg-free-editor.qr-code-generator.com/main/assets/images/websiteQRCode_noFrame.png',
          ),
          SizedBox(height: 8,),
          item(
            size,
            'Cloud của tôi',
            'Lưu trữ và các tin nhắn quan trọng',
            'https://as2.ftcdn.net/v2/jpg/02/10/45/17/1000_F_210451779_nsAQtmtSvLI1NxnnLq2F0Rc52cWOCoUq.jpg',
          ),
          item(
            size,
            'Dung lượng và dữ liệu',
            'Quản lý dữ liệu zalo của bạn',
            'https://cdn1.vectorstock.com/i/1000x1000/07/45/personal-data-check-icon-outline-style-vector-25830745.jpg',
          ),
          SizedBox(height: 8,),
          item(
            size,
            'Tài khoản và bảo mật',
            '',
            'https://cdn1.vectorstock.com/i/1000x1000/81/50/protect-icon-vector-23458150.jpg',
          ),
          item(
            size,
            'Quyền riêng tư',
            '',
            'https://www.shutterstock.com/image-vector/pad-lock-vector-icon-on-260nw-1697771800.jpg',
          ),
        ],
      ),
    );
  }

  Container item(Size size, String x, String y, String z) {
    return Container(
          padding: EdgeInsets.all(16),
          height: 80,
          width: size.width,
          color: Colors.white,
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    z,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(x),
                  Text(
                    y,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13
                    ),
                  )
                ],
              )
            ],
          ),
        );
  }
}

