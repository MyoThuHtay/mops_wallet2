import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Dapp extends StatefulWidget {
  const Dapp({Key? key}) : super(key: key);

  @override
  _DappState createState() => _DappState();
}

class _DappState extends State<Dapp> {
  final myController = TextEditingController();
  String data = '';
  //String web = '';

  // showAlert(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Please enter a website url'),
  //         actions: [
  //           TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Text('OK'))
  //         ],
  //       );
  //     },
  //   );
  // }

  // addValue() {
  //   if (myController.text == '') {
  //     showAlert(context);
  //   } else {
  //     setState(() {
  //       data = myController.text;
  //     });
  //
  //   }
  // }

  void _launchURL(String url) async {
    String url = myController.text;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        // forceSafariVC: true,
        // forceWebView: true,
        // headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
    //return url;
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            //width: 400,
            height: 45,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).primaryColor, // Creates border
            ),
            child: TextFormField(
              showCursor: true,
              cursorColor: Colors.black38,
              controller: myController,
              enableSuggestions: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                hintText: '  Search or enter website url',
                suffixIcon: TextButton(
                    onPressed: () {
                      _launchURL(myController.text);
                    },
                    child: Text(
                      'Go',
                      style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: 20),
                    )),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / .5,
                        // height: MediaQuery.of(context).size.height / 30,
                        child: const Text(
                          'Dapps',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 350,
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/687/small/pancakeswap.jpeg?1626060212'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('PancakeSwap (v2)'),
                                subtitle: const Text(
                                    'The flippening is coming.Stack \$CAKE on Binance Smart Chain.'),
                                onTap: () async {
                                  const url = 'https://pancakeswap.finance';
                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    await launchUrl(
                                    Uri.parse(url),
                                      // forceSafariVC: true,
                                      // forceWebView: true,
                                      // headers: <String, String>{
                                      //   'my_header_key': 'my_header_value'

                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/720/small/sushiswap-polygon-matic.png?1634201163'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('SushiSwap'),
                                subtitle: const Text(
                                    'Swap, earn, stack yields, lend, borrow, leverage all on one decentralized.'),
                                onTap: () async {
                                  const url = 'https://app.sushi.com/swap';
                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    await launchUrl(
                                      Uri.parse(url),
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/626/small/bakeryswap.png?1613740980'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('BakerySwap'),
                                subtitle: const Text(
                                    'AMM and NFT Marketplace solutions in one place.'),
                                onTap: () async {
                                  const url =
                                      'https://www.bakeryswap.org/#/swap';
                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    await launchUrl(
                                      Uri.parse(url),
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/594/small/bscswap_logo.png?1602555906'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('BSCSwap'),
                                subtitle: const Text(
                                    'AMM now available for Binance Smart Chain.'),
                                onTap: () async {
                                  const url =
                                      'https://trade.bscswap.com/#/swap';
                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    await launchUrl(
                                      Uri.parse(url),
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/594/small/bscswap_logo.png?1602555906'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('BSCSwap'),
                                subtitle: const Text(
                                    'Swap, earn, stack yields, lend, borrow, leverage all on one decentralized.'),
                                onTap: () async {
                                  const url = 'https://bscswap.com';
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                      headers: <String, String>{
                                        'my_header_key': 'my_header_value'
                                      },
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/594/small/bscswap_logo.png?1602555906'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('BSCSwap'),
                                subtitle: const Text(
                                    'Swap, earn, stack yields, lend, borrow, leverage all on one decentralized.'),
                                onTap: () async {
                                  const url = 'https://bscswap.com';
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                      headers: <String, String>{
                                        'my_header_key': 'my_header_value'
                                      },
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / .5,
                        // height: MediaQuery.of(context).size.height / 30,
                        child: const Text(
                          'Popular',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 350,
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/687/small/pancakeswap.jpeg?1626060212'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('PancakeSwap (v2)'),
                                subtitle: const Text(
                                    'The flippening is coming.Stack \$CAKE on Binance Smart Chain.'),
                                onTap: () async {
                                  const url = 'https://pancakeswap.finance';
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                      headers: <String, String>{
                                        'my_header_key': 'my_header_value'
                                      },
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/720/small/sushiswap-polygon-matic.png?1634201163'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('SushiSwap'),
                                subtitle: const Text(
                                    'Swap, earn, stack yields, lend, borrow, leverage all on one decentralized.'),
                                onTap: () async {
                                  const url = 'https://app.sushi.com/swap';
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                      headers: <String, String>{
                                        'my_header_key': 'my_header_value'
                                      },
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/626/small/bakeryswap.png?1613740980'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('BakerySwap'),
                                subtitle: const Text(
                                    'AMM and NFT Marketplace solutions in one place.'),
                                onTap: () async {
                                  const url =
                                      'https://www.bakeryswap.org/#/swap';
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                      headers: <String, String>{
                                        'my_header_key': 'my_header_value'
                                      },
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/594/small/bscswap_logo.png?1602555906'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('BSCSwap'),
                                subtitle: const Text(
                                    'AMM now available for Binance Smart Chain.'),
                                onTap: () async {
                                  const url =
                                      'https://trade.bscswap.com/#/swap';
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                      headers: <String, String>{
                                        'my_header_key': 'my_header_value'
                                      },
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/594/small/bscswap_logo.png?1602555906'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('BSCSwap'),
                                subtitle: const Text(
                                    'Swap, earn, stack yields, lend, borrow, leverage all on one decentralized.'),
                                onTap: () async {
                                  const url = 'https://bscswap.com';
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                      headers: <String, String>{
                                        'my_header_key': 'my_header_value'
                                      },
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/594/small/bscswap_logo.png?1602555906'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('BSCSwap'),
                                subtitle: const Text(
                                    'Swap, earn, stack yields, lend, borrow, leverage all on one decentralized.'),
                                onTap: () async {
                                  const url = 'https://bscswap.com';
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                      headers: <String, String>{
                                        'my_header_key': 'my_header_value'
                                      },
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / .5,
                        //height: MediaQuery.of(context).size.height / 30,
                        child: const Text(
                          'Yield Farming',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 350,
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/687/small/pancakeswap.jpeg?1626060212'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('PancakeSwap (v2)'),
                                subtitle: const Text(
                                    'The flippening is coming.Stack \$CAKE on Binance Smart Chain.'),
                                onTap: () async {
                                  const url = 'https://pancakeswap.finance';
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                      headers: <String, String>{
                                        'my_header_key': 'my_header_value'
                                      },
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/720/small/sushiswap-polygon-matic.png?1634201163'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('SushiSwap'),
                                subtitle: const Text(
                                    'Swap, earn, stack yields, lend, borrow, leverage all on one decentralized.'),
                                onTap: () async {
                                  const url = 'https://app.sushi.com/swap';
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                      headers: <String, String>{
                                        'my_header_key': 'my_header_value'
                                      },
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/626/small/bakeryswap.png?1613740980'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('BakerySwap'),
                                subtitle: const Text(
                                    'AMM and NFT Marketplace solutions in one place.'),
                                onTap: () async {
                                  const url =
                                      'https://www.bakeryswap.org/#/swap';
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                      headers: <String, String>{
                                        'my_header_key': 'my_header_value'
                                      },
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/594/small/bscswap_logo.png?1602555906'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('BSCSwap'),
                                subtitle: const Text(
                                    'AMM now available for Binance Smart Chain.'),
                                onTap: () async {
                                  const url =
                                      'https://trade.bscswap.com/#/swap';
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                      headers: <String, String>{
                                        'my_header_key': 'my_header_value'
                                      },
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/594/small/bscswap_logo.png?1602555906'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('BSCSwap'),
                                subtitle: const Text(
                                    'Swap, earn, stack yields, lend, borrow, leverage all on one decentralized.'),
                                onTap: () async {
                                  const url = 'https://bscswap.com';
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                      headers: <String, String>{
                                        'my_header_key': 'my_header_value'
                                      },
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://assets.coingecko.com/markets/images/594/small/bscswap_logo.png?1602555906'),
                                ),
                                tileColor: Theme.of(context).primaryColor,
                                title: const Text('BSCSwap'),
                                subtitle: const Text(
                                    'Swap, earn, stack yields, lend, borrow, leverage all on one decentralized.'),
                                onTap: () async {
                                  const url = 'https://bscswap.com';
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                      headers: <String, String>{
                                        'my_header_key': 'my_header_value'
                                      },
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                            Card(
                              child: ListTile(
                                  title: Text('Motivation $int'),
                                  subtitle: const Text(
                                      'this is a description of the motivation')),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
