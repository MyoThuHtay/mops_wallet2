import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dex extends StatelessWidget {
  const Dex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text('DEX'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        '   You Pay',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 50,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 10,
                          child: const Text(
                            '0',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: ListTile(
                            leading: const CircleAvatar(
                              radius: 15.0,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                  'https://assets.coingecko.com/coins/images/825/thumb/binance-coin-logo.png?1547034615'),
                            ),
                            title: const Text(
                              "BNB",
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                          child: const Text(
                            'Balance: 0',
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        '   You Get',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 10,
                          child: const Text(
                            '0',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: ListTile(
                            leading: const CircleAvatar(
                              radius: 15.0,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                  'https://assets.coingecko.com/coins/images/825/thumb/binance-coin-logo.png?1547034615'),
                            ),
                            title: const Text(
                              "BNB",
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                          child: const Text(
                            'Balance: 0',
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.blueGrey, width: 2),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color:
                        Theme.of(context).indicatorColor, // Creates border
                      ),
                      width: MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.height / 20,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          '25%',
                          style:
                          TextStyle(color: Colors.blueAccent, fontSize: 14),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.blueGrey, width: 2),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color:
                        Theme.of(context).indicatorColor, // Creates border
                      ),
                      width: MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.height / 20,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          '50%',
                          style:
                          TextStyle(color: Colors.blueAccent, fontSize: 14),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.blueGrey, width: 2),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color:
                        Theme.of(context).indicatorColor, // Creates border
                      ),
                      width: MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.height / 20,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          '75%',
                          style:
                          TextStyle(color: Colors.blueAccent, fontSize: 14),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.blueGrey, width: 2),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color:
                        Theme.of(context).indicatorColor, // Creates border
                      ),
                      width: MediaQuery.of(context).size.width / 7,
                      height: MediaQuery.of(context).size.height / 20,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          '100%',
                          style:
                          TextStyle(color: Colors.blueAccent, fontSize: 14),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 15,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            const Center(
              child: Text('1 BNB = 695.25282387 TWT'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.blueGrey, width: 2),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueAccent, // Creates border
                ),
                width: 300,
                height: MediaQuery.of(context).size.height / 20,
                child: TextButton(
                  child: const Text(
                    'SWAP',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
