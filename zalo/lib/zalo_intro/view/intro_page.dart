import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:zalo/zalo_sign_in/view/sign_in_page.dart';
import 'package:zalo/zalo_sign_up/view/sign_up_page.dart';
import 'package:zalo/common/navigate.dart';
import 'package:zalo/gen/assets.gen.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  int selectedPage = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height - 24,
            child: Column(
              children: [
                Container(
                  height: (size.height - 24) * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          width: size.width * 0.7,
                          child:  PageView(
                            children: [
                              Image.asset(
                                Assets.images.zalo.keyName,
                              ),
                              Image.asset(
                                Assets.images.zalo.keyName,
                              ),
                              Image.asset(
                                Assets.images.zalo.keyName,
                              ),
                              Image.asset(
                                Assets.images.zalo.keyName,
                              ),
                              Image.asset(
                                Assets.images.zalo.keyName,
                              )
                            ],
                            physics: BouncingScrollPhysics(),
                            controller: _pageController,
                            onPageChanged: (page) {
                              setState(() {
                                selectedPage = page;
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: PageViewDotIndicator(
                          currentItem: selectedPage,
                          count: 5,
                          unselectedColor: Colors.black26,
                          selectedColor: Colors.blue,
                          size: Size(8, 8),
                          unselectedSize: Size(6, 6),
                          duration: Duration(milliseconds: 150),
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          fadeEdges: false,
                          boxShape: BoxShape.circle,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: (size.height - 24) * 0.3,
                  child: Container(
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            button(
                              'ĐĂNG NHẬP',
                              Colors.white,
                              Colors.blueAccent,
                              size,
                              () {
                                navigate(context, SignInPage());
                              }
                            ),
                            SizedBox(height: 16,),
                            button(
                              'ĐĂNG KÝ',
                              Colors.black,
                              Colors.blueAccent.withOpacity(0.2),
                              size,
                              () {
                                navigate(context, SignUpPage());
                              }
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Tiếng Việt',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 16,),
                              Text('Tiếng Anh')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget button(String text, Color textColor,
      Color buttonColor, Size size, Function()? function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        width: size.width * 0.5,
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold
          ),
        ),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(40)
        ),
      ),
    );
  }
}
