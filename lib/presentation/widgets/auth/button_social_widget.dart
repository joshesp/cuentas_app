import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum TypeButtonSocial {
  google(
    icon: 'assets/icons/google-logo.svg',
    defaultSpace: 10,
  ),
  facebook(
    icon: 'assets/icons/facebook-logo.svg',
    defaultSpace: 7,
  ),
  apple(
    icon: 'assets/icons/apple-logo.svg',
    defaultSpace: 10,
  );

  final String icon;
  final double defaultSpace;

  const TypeButtonSocial({required this.icon, required this.defaultSpace});
}

class ButtonSocialWidget extends StatelessWidget {
  final TypeButtonSocial type;

  const ButtonSocialWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: EdgeInsets.all(type.defaultSpace),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.fromBorderSide(
          BorderSide(
            color: Coolors.gray,
            width: 1.5,
          ),
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          type.icon,
        ),
      ),
    );
  }
}
