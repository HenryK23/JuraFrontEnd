import 'package:flutter/material.dart';

import '../utils/constants.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //fairly self-explanitory. Just shows the logos side by side
    var width = MediaQuery.of(context).size.width / 4;
    var height = MediaQuery.of(context).size.height;
    return Container( 
      width: width,
      height: height / 8,
      color: primaryBlack,
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Image.asset("images/logo.png"),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Image.asset("images/TextLogoAlt.png"),
        )
      ]),
    );
  }
}
