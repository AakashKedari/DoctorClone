import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class MenuIconName extends StatelessWidget {
  final Icon icon;
  final String optionName;
  final Widget? toNavigate;
   MenuIconName({super.key, required this.icon, required this.optionName, required this.toNavigate});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon,
        const Gap(2),
        TextButton( onPressed: () {
          if(toNavigate != null)
            Navigator.push(context, PageTransition(child: toNavigate!, type: PageTransitionType.fade,duration: Duration(milliseconds: 500)));
        }, child:  Text(optionName,style: const TextStyle(color: Colors.white)),

        ),
      ],
    );

  }
}
