import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../const.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Article Details',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: appBarColor,
          surfaceTintColor: appBarColor,
        ),
        body: Stack(children: [
          Container(
            color: appBarColor,
          ),
          Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  Flexible(
                      flex: 2,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40)),
                              child: Image.asset('assets/images/newsTile.jpg',fit: BoxFit.cover,)))),
                  const ListTile(leading: CircleAvatar(),
                  title: Text(
                    'Doctor Name'
                  ),
                    subtitle: Text('Specialization'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.share),
                        Gap(10),
                        Icon(FontAwesomeIcons.save)
                      ],
                    ),
                  ),
                  const Gap(10),
                  const Flexible(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(articleDetails),
                      ))

                ],
              ))
        ])
        // body: ,
        );
  }
}
