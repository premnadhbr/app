import 'package:flutter/material.dart';
import '../../../controller/home/bloc/home_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/constants/constants.dart';

class CardWidget extends StatelessWidget {
  final HomeBloc homeBloc;
  final String path;
  final event;
  final String buttonText;
  const CardWidget({
    Key? key,
    required this.event,
    required this.homeBloc,
    required this.path,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.white,
        onTap: () => homeBloc.add(event),
        child: Column(
          children: [
            SvgPicture.asset(
              path,
              fit: BoxFit.contain,
              height: MediaQuery.sizeOf(context).width / 1.4,
            ),
            Constants.heightSized,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(buttonText, style: Constants.cartTextStyle),
                Constants.widthtSized,
                Constants.cardCircleAvatar,
              ],
            ),
            Constants.heightSized,
          ],
        ),
      ),
    );
  }
}
