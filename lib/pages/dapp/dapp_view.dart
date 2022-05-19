import 'package:flutter/material.dart';
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
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(image),
        ),
        tileColor: Theme.of(context).primaryColor,
        title: Text(name),
        subtitle: Text(description!),
        onTap: () async {
          //var uri = url;
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url), mode: LaunchMode.platformDefault);
          } else {
            throw 'Could not launch $url';
          }
        },
      ),
    );
  }
}
