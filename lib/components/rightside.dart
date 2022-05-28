import 'package:flutter/material.dart';
import 'package:noteapp/utils/constants.dart';
import 'package:provider/provider.dart';

import '../providers/noteprovider.dart';
import 'TextBox.dart';

class RightSide extends StatelessWidget {
  const RightSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //this is the blue side 
    var width = (MediaQuery.of(context).size.width / 4) * 3; // takes up 3/4 of the available room. 
    return Container(
      width: width,
      color: primaryBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Provider.of<Notes>(context).noteList.isEmpty //checks if there is any notes available if not then it hides the text box but without disrupting any logic
              ? const Visibility(
                  child: CustomTextBox(),
                  maintainState: true,
                  maintainSemantics: true,
                  maintainInteractivity: true,
                  maintainSize: true,
                  maintainAnimation: true,
                  visible: false,
                )
              : const CustomTextBox(),
        ],
      ),
    );
  }
}
