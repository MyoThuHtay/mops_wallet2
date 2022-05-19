import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/controllers/search_controller.dart';
import 'package:mops_wallet/utils/colors.dart';
import 'package:mops_wallet/utils/dimensions.dart';

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
              }
              ,
              onFieldSubmitted: (String text) {
                //myController.text = text;
                coin.getSearch(text);
            }
            ,
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
              return ListTile(
                tileColor: AppColors.textColor,
                leading: const Icon(
                  Icons.add_circle_outline_sharp,
                  size: 40,
                  color: Colors.blue,
                ),
                title: const Text('Add Custom Token'),
                onTap: () {},
              );
            }
            index -= 1;
            return ListTile(
              onTap: (){},
              tileColor: AppColors.mainColor,
              leading: CircleAvatar(
                radius: 20.0,
                backgroundColor: AppColors.conColor,
                child: CachedNetworkImage(
                  imageUrl: coin.searchList[index].coins[index].large!,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.fitWidth),
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.iconColor0,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[500]!,
                            offset: const Offset(4, 4),
                            blurRadius: 10,
                            spreadRadius: 1),
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4, -4),
                            blurRadius: 10,
                            spreadRadius: 1)
                      ],
                    ),
                    height: Dimensions.height30 * 3 + 8,
                    width: Dimensions.width30 * 2 + 8,
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/banner.png'),
                ),
              ),
              title: Text(coin.searchList[index].coins[index].name!),
              trailing: Switch.adaptive(
                value: coin.isLoaded == isShow,
                activeColor: AppColors.iconColor2,
                onChanged: (_value) {
                  setState(() {
                    isShow = _value;
                  });

                  print(isShow);
                },
              ),
            );
          },
        ),
      );
    });
  }
}
