import 'package:flutter/material.dart';
import 'package:zalo/repository/repository.dart';
import 'package:zalo/common/navigate.dart';
import 'package:zalo/zalo_intro/view/intro_page.dart';

class IndividualPage extends StatelessWidget {
  const IndividualPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Repository.signOut();
          navigate(context, IntroPage());
        },
        child: Text('Sign out'),
      ),
    );
  }
}

