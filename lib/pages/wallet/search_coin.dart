import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/controllers/search_controller.dart';
import 'package:mops_wallet/utils/colors.dart';

class SearchCoin extends StatefulWidget {
  const SearchCoin({Key? key}) : super(key: key);

  @override
  SearchCoinState createState() => SearchCoinState();
}

class SearchCoinState extends State<SearchCoin> {
  final myController = TextEditingController();
  bool isShow = true;

  @override
  void initState() {
    Get.find<SearchController>().getSearch('coin');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Get.find<SearchController>().getSearch('coin');
    return GetBuilder<SearchController>(builder: (coin) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: TextFormField(
              showCursor: true,
              cursorColor: Colors.black38,
              controller: myController,
              enableSuggestions: true,
              onChanged: (String text) {
                //myController.text = text;
                coin.getSearch(text);
              },
              onFieldSubmitted: (String text) {
                //myController.text = text;
                coin.getSearch(text);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '  Search Tokens',
                suffixIcon: TextButton(
                    onPressed: () {
                      coin.getSearch(myController.text);
                    },
                    child: Text(
                      'Go',
                      style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: 20),
                    ),),
              ),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: coin.searchList.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  ListTile(
                    tileColor: Theme.of(context).primaryColor,
                    leading: const Icon(
                      Icons.add_circle_outline_sharp,
                      size: 40,
                      color: Colors.blue,
                    ),
                    title: const Text('Add Custom Token'),
                    onTap: () {},
                  ),
                  const Divider(
                    indent: 30,
                    endIndent: 30,
                    height: 05,
                    color: AppColors.conColor,
                  )
                ],
              );
            }
            index -= 1;
            String name = coin.searchList[index].coins![index].name!;
            String symbol = coin.searchList[index].coins![index].symbol!;
            String logo = coin.searchList[index].coins![index].large!;
            return ListTile(
              onTap: () {},
              tileColor: Theme.of(context).primaryColor,
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.avatorColor, width: 1),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image.network(
                  logo,
                  fit: BoxFit.contain,
                ),
              ),
              title: Row(
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      name.length > 20 ? '${name.substring(0, 15)}...' : name,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      symbol.length > 15
                          ? ' ${symbol.substring(0, 15)..toUpperCase()}... '
                          : symbol.toUpperCase(),
                      style: const TextStyle(color: AppColors.tittleColor),
                    ),
                  ),
                ],
              ),
              trailing: Switch.adaptive(
                value: isShow,
                activeColor: AppColors.iconColor2,
                onChanged: (value) {
                  setState(() {
                    isShow = value;
                    if (kDebugMode) {
                      print(value);
                    }
                  });
                },
              ),
            );
          },
        ),
      );
    });
  }
}
