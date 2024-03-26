import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum TypeButtonSocial {
  google(
    icon: 'assets/icons/google-icon.svg',
    defaultSpace: 6,
  ),
  facebook(
    icon: 'assets/icons/facebook-icon.svg',
    defaultSpace: 4,
  ),
  apple(
    icon: 'assets/icons/apple-icon.svg',
    defaultSpace: 6,
  ),
  twitter(
    icon: 'assets/icons/x-icon.svg',
    defaultSpace: 6,
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
      width: 44,
      height: 44,
      padding: EdgeInsets.all(type.defaultSpace),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.fromBorderSide(
          BorderSide(
            color: Coolors.gray.withOpacity(0.5),
            width: 1,
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
