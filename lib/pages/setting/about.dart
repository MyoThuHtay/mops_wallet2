import 'package:flutter/material.dart';
import 'package:mops_wallet/utils/colors.dart';
import 'package:mops_wallet/utils/constants/constants.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          elevation: 1,
          centerTitle: true,
          title: const Text('About'),
        ),
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          children: [
            ListTile(
              tileColor: AppColors.backgroundColor,
              title: const Text('Rate Us On Play Market'),
              onTap: () {},
            ),
            const Divider(
              height: .5,
              color: Colors.black12,
              thickness: .5,
            ),
            ListTile(
              tileColor: AppColors.backgroundColor,
              title: const Text('Terms Of Service'),
              onTap: () {},
            ),
            const Divider(
              height: .5,
              color: Colors.black12,
              thickness: .5,
            ),
            ListTile(
              tileColor: AppColors.backgroundColor,
              title: const Text('Support'),
              onTap: () {},
            ),
            const Divider(
              height: .5,
              color: Colors.black12,
              thickness: .5,
            ),
            ListTile(
              tileColor: AppColors.backgroundColor,
              title: const Text('Make A Suggestion'),
              onTap: () {},
            ),
            const Divider(
              height: .5,
              color: Colors.black12,
              thickness: .5,
            ),
            const ListTile(
              tileColor: AppColors.backgroundColor,
              title: Text('Version'),
              subtitle: Text('${Constants.versionName}.${Constants.version}'),
            ),
            const Divider(
              height: .5,
              color: Colors.black12,
              thickness: .5,
            ),
          ],
        ),);
  }
}
