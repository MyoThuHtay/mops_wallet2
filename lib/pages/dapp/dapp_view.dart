import 'package:flutter/material.dart';
import 'package:mops_wallet/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class DappView extends StatelessWidget {
  final String image;
  final String name;
  final String? description;
  final String url;

  const DappView(
      {Key? key,
      required this.url,
      required this.name,
      required this.image,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: ListTile(
        leading: CircleAvatar(
          child: Image.network(image),
        ),
        tileColor: AppColors.backgroundColor,
        title: Text(name),
        subtitle: Text(description!.length > 50
            ? description!.substring(0, 50) + "..."
            : description!),
        onTap: () async {
          //var uri = url;
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url),
                mode: LaunchMode.platformDefault,
                webViewConfiguration:
                    const WebViewConfiguration(enableJavaScript: true));
          } else {
            throw 'Could not launch $url';
          }
        },
      ),
    );
  }
}
