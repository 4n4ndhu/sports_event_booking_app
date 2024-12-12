import 'package:flutter/material.dart';
import 'package:sports_event_booking_app/utils/color_constans.dart';

class drawerListile extends StatelessWidget {
  final Widget? icon;
  final String text;
  final void Function()? onpress;

  const drawerListile(
      {super.key, this.icon, required this.text, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
              color: ColorConstans.primaryGreen,
              borderRadius: BorderRadius.circular(10)),
          child: icon,
          height: 50,
          width: 50,
        ),
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
