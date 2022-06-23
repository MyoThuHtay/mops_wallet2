import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/controllers/search_controller.dart';
import 'package:mops_wallet/utils/colors.dart';

class SearchCoin extends StatefulWidget {
  const SearchCoin({Key? key}) : super(key: key);

  @override
  _SearchCoinState createState() => _SearchCoinState();
}

class _SearchCoinState extends State<SearchCoin> {
  final myController = TextEditingController();
  bool isShow = true;

  @override
  void dispose() {
    super.dispose();
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeProvider>(context);
    return GetBuilder<SearchController>(builder: (coin) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBarColor,
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
                    )),
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: coin.searchList.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  ListTile(
                    tileColor: AppColors.backgroundColor,
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
            return ListTile(
              onTap: () {},
              tileColor: AppColors.backgroundColor,
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.avatorColor, width: 1),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image.network(
                  coin.searchList[index].coins![index].large!,
                  fit: BoxFit.contain,
                  // width: 40,
                  // height: 40,
                ),
              ),
              title: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      coin.searchList[index].coins![index].name!,
                      style: const TextStyle(color: AppColors.textColor),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      coin.searchList[index].coins![index].symbol!,
                      style: const TextStyle(color: AppColors.tittleColor),
                    ),
                  ),
                ],
              ),
              //subtitle: Text(coin.searchList[index].coins![index].symbol!),
              trailing: Switch.adaptive(
                value: isShow,
                activeColor: AppColors.iconColor2,
                onChanged: (_value) {
                  setState(() {
                    isShow = _value;
                    if (kDebugMode) {
                      print(_value);
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
