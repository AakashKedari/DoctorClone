import 'package:card_swiper/card_swiper.dart';
import 'package:doctor_clone/screens/article_details.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

import '../const.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
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
          'Articles',
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
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  const Text('Recommended',style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                  const Gap(10),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Swiper(
                          autoplay: true,
                          loop: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Stack(fit: StackFit.expand, children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'assets/images/news_article.jpg',
                                    fit: BoxFit.fill,
                                  )),
                              const Positioned(
                                  left: 10,
                                  bottom: 20,
                                  child: Text(
                                    'Article Title',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                              const Positioned(
                                  left: 10,
                                  bottom: 10,
                                  child: Text(
                                    'Article Description',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )),
                            ]);
                          }),
                    ),
                  ),
                  const Gap(10),
                  const Text(
                    'News Articles',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),const Gap(10),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                    return InkWell(
                      onTap: () => Navigator.push(context, PageTransition(child: ArticleDetails(), type: PageTransitionType.fade)),
                      child: ListTile(
                        title: const Text('Article Title'),
                        leading: SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset('assets/images/newsTile.jpg'),
                        ),
                        subtitle: const Text('few minutes ago'),
                      ),
                    );
                  })
                ],
              ),
            ))
      ]),
    );
  }
}
