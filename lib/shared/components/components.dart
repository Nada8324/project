import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

void navigateTo(context,widget){

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );

}
void navigateAndFinish(context,widget){

  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (route) => false,
  );

}
class profileitem extends StatelessWidget {
  profileitem({
    super.key,
    required this.icon,
    required this.text,
    this.onthepresed,
  });
  final Icon icon;
  final String text;
  final Function()? onthepresed;
  //

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon.icon,
              color: Color(0xff8f959e),
              size: 30,
            ),
            SizedBox(
              width: 15.0,
            ),
            TextButton(
                onPressed: onthepresed,
                child: Text(
                  text,
                  style: TextStyle(
                      color: themeProvider.textcolor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}