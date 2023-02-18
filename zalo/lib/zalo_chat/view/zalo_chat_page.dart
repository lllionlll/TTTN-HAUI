import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final list = [
      'https://www.invert.vn/media/uploads/uploads/2022/12/06172901-11.jpeg',
      'https://donoithatdanang.com/wp-content/uploads/2021/11/hinh-anh-anime-boy-chibi.jpg',
      'https://donoithatdanang.com/wp-content/uploads/2021/11/hinh-anh-anime-boy-buon.jpg',
      'https://donoithatdanang.com/wp-content/uploads/2021/11/anh-dep-anime-boy-chibi.jpg',
      'https://donoithatdanang.com/wp-content/uploads/2021/11/anh-chat-anime-boy-chat.jpg',
      'https://donoithatdanang.com/wp-content/uploads/2021/11/tai-anh-anime-nam-ngau.jpg',
      'https://donoithatdanang.com/wp-content/uploads/2021/11/hinh-anh-anime-nam-buon-3.jpg',
      'https://donoithatdanang.com/wp-content/uploads/2021/11/Bo-suu-tap-999-hinh-anh-anime-lanh-lung-cuc-cuon-hut.jpg',
      'https://donoithatdanang.com/wp-content/uploads/2021/11/20-hinh-anh-anime-nam-buon-khoc-lanh-lung-anime-boy-images-hd-2.jpg'
    ];
    return Center(
      child: Scaffold(
        // backgroundColor: Colors.grey.withOpacity(0.1),
        body: SafeArea(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) {
              return itemChat(size, list[index % list.length]);
            },
          ),
        ),
      ),
    );
  }

  Container itemChat(Size size, String avt) {
    return Container(
        width: size.width,
        height: 70,
        padding: EdgeInsets.only(left: 16),
        color: Colors.white,
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  avt,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ),
            SizedBox(width: 16,),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nguyễn Hoàng Lâm',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            'Bạn: Nguyễn Hoàng Lâm',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '5 giờ',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Text(
                            '+10',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16,)
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          width: 0.2,
                          color: Colors.grey
                        )
                    )
                ),
              ),
            )
          ],
        ),
      );
  }
}

