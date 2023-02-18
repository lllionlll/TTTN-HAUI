import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zalo/zalo_chat/view/zalo_chat_page.dart';
import 'package:zalo/zalo_contact/view/zalo_contact_page.dart';
import 'package:zalo/zalo_diary/view/zalo_diary_page.dart';
import 'package:zalo/zalo_discovery/view/zalo_discovery_page.dart';
import 'package:zalo/zalo_individual_page/view/zalo_individual_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        leading: Icon(CupertinoIcons.search),
        title: GestureDetector(
          onTap: () {

          },
          child: Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: AppBar().preferredSize.height,
            child: Text(
              'Tìm kiếm',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16
              ),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.qr_code_scanner, size: 28,),
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(CupertinoIcons.plus, size: 28,),
            ),
          )
        ],
        titleSpacing: 0,

      ),
      body: IndexedStack(
        index: selectedTab,
        children: [
          ChatPage(),
          ContactPage(),
          DiscoveryPage(),
          DiaryPage(),
          IndividualPage()
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(4),
                child: Icon(CupertinoIcons.chat_bubble_text_fill),
              ),
              label: 'Tin nhắn',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(4),
                child: Icon(CupertinoIcons.person_crop_rectangle_fill),
              ),
              label: 'Danh bạ',
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(CupertinoIcons.rectangle_grid_2x2_fill),
                ),
                label: 'Khám phá'
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(CupertinoIcons.clock),
                ),
                label: 'Nhật ký'
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(CupertinoIcons.person_fill),
                ),
                label: 'Cá nhân'
            )
          ],
          currentIndex: selectedTab,
          onTap: (value) {
            setState(() {
              selectedTab = value;
            });
          },
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 11,
          unselectedFontSize: 11,
        ),
      )
    );
  }
}
