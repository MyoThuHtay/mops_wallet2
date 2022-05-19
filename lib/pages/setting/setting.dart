import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mops_wallet/utils/colors.dart';
import 'package:mops_wallet/utils/dimensions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'about.dart';


class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.appBarColor,
        title: const Text('Settings'),
      ),
      backgroundColor: AppColors.iconColor0,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Container(
                width: Dimensions.width30,
                height: Dimensions.height30,
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black26, width: 2),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                  color: Colors.green, // Creates border
                ),
                child: Icon(
                  Icons.account_balance_wallet_sharp,
                  //FontAwesomeIcons.wallet,
                  color: Colors.white,
                  size: Dimensions.iconSize24,
                ),
              ),
              title: const Text('Wallets'),
              subtitle: const Text('Wallets'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  //final provider = Provider.of(context).

                },
              ),
            ),
            const Divider(
              height: .5,
              color: Colors.black12,
              thickness: .5,
            ),
            ListTile(
              leading: Container(
                width: Dimensions.width30,
                height: Dimensions.height30,
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black26, width: 2),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black, // Creates border
                ),
                child: Icon(
                  CupertinoIcons.moon_stars_fill,
                  color: Colors.white,
                  size: Dimensions.iconSize24,
                ),
              ),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                  value: true,
                  onChanged: (value) {
                    // final provider =
                    // Provider.of<ThemeProvider>(context, listen: false);
                    // provider.toggleTheme(value);
                  }),
            ),
            const Divider(
              height: .5,
              color: Colors.black12,
              thickness: .5,
            ),
            ListTile(
              leading: Container(
                width: Dimensions.width30,
                height: Dimensions.height30,
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black26, width: 2),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey, // Creates border
                ),
                child: Icon(
                  CupertinoIcons.lock,
                  color: Colors.white,
                  size: Dimensions.iconSize24,
                ),
              ),
              title: const Text('Security'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {

                },
              ),
            ),
            ListTile(
              leading: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black26, width: 2),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red, // Creates border
                ),
                child: const Icon(
                  CupertinoIcons.app_badge,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              title: const Text('Push Notifications'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {},
              ),
            ),
            ListTile(
              leading: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black26, width: 2),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.greenAccent, // Creates border
                ),
                child: const Icon(
                  CupertinoIcons.book,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              title: const Text('Preferences'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {},
              ),
            ),
            const Divider(
              height: .5,
              color: Colors.black12,
              thickness: .5,
            ),
            ListTile(
              leading: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black26, width: 2),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red, // Creates border
                ),
                child: const Icon(
                  CupertinoIcons.money_dollar,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              title: const Text('Currency'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {

                },
              ),
            ),
            const Divider(
              height: .5,
              color: Colors.black12,
              thickness: .5,
            ),
            ListTile(
              leading: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black26, width: 2),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red, // Creates border
                ),
                child: const Icon(
                  Icons.monetization_on,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              title: const Text('Price Alert'),
              //subtitle: const Text('this is a description of the motivation'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {},
              ),
            ),
            const Divider(
              height: .5,
              color: Colors.black12,
              thickness: .5,
            ),
            ListTile(
              leading: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black26, width: 2),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueAccent, // Creates border
                ),
                child: const Icon(
                  CupertinoIcons.arrow_2_circlepath,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              title: const Text('Wallet Connect'),
              //subtitle: const Text('this is a description of the motivation'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {},
              ),
            ),
            const Divider(
              height: .5,
              color: Colors.black12,
              thickness: .5,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 350,
                  height: 20,
                  child: Text(
                    'Join Community',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
                ListTile(
                  leading: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.black26, width: 2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orangeAccent, // Creates border
                    ),
                    child: const Icon(
                      Icons.help_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  title: const Text('Help Center'),
                  //subtitle: const Text('this is a description of the motivation'),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {},
                  ),
                ),
                ListTile(
                  leading: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.black26, width: 2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blueAccent, // Creates border
                    ),
                    child: const Icon(
                      FontAwesomeIcons.twitter,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  title: const Text('Twitter'),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {},
                  ),
                ),
                ListTile(
                  leading: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.black26, width: 2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue, // Creates border
                    ),
                    child: const Icon(
                      FontAwesomeIcons.telegram,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  title: const Text('Telegram'),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {},
                  ),
                ),
                ListTile(
                  leading: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.black26, width: 2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue.shade800, // Creates border
                    ),
                    child: const Icon(
                      FontAwesomeIcons.facebookSquare,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  title: const Text('FaceBook'),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const Divider(
              height: .5,
              color: Colors.black12,
              thickness: .5,
            ),
            ListTile(
              //tileColor: Theme.of(context).primaryColor,
              leading: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black26, width: 2),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red, // Creates border
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              title: const Text('About'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const About()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
