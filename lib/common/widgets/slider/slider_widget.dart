import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/button_style_theme.dart';
import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:cuentas_app/config/theme/text_style_theme.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final List<Map<String, String>> sliderItems;

  const SliderWidget({
    super.key,
    required this.sliderItems,
  });

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final pageControl = PageController();
  int currentIndexSlide = 1;

  @override
  void dispose() {
    pageControl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: () {
              // TODO: Redirect to login
            },
            child: Text(
              'Omitir'.toUpperCase(),
              style: TextStyleTheme.buttonMedium.copyWith(
                color: Coolors.dark,
              ),
            ),
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: pageControl,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.sliderItems.length,
            itemBuilder: (context, index) {
              final slide = widget.sliderItems[index];

              return _SlideContent(slide: slide);
            },
            onPageChanged: (index) {
              setState(() {
                currentIndexSlide = index;
              });
            },
          ),
        ),
        _SliderNavigation(
          totalBullets: widget.sliderItems.length,
          bulletActive: currentIndexSlide,
          onNextSlide: onNextSlide,
        )
      ],
    );
  }

  void onNextSlide() {
    pageControl.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }
}

class _SlideContent extends StatelessWidget {
  const _SlideContent({
    required this.slide,
  });

  final Map<String, String> slide;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: maxSpacing),
        Image.asset(slide["image"]!),
        const SizedBox(height: 64),
        Text(
          slide["title"]!,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Coolors.dark,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: minSpacing),
        Text(
          slide["description"]!,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Coolors.dark,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _SliderNavigation extends StatelessWidget {
  final int totalBullets;
  final int bulletActive;
  final void Function() onNextSlide;

  const _SliderNavigation({
    required this.totalBullets,
    required this.bulletActive,
    required this.onNextSlide,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(totalBullets, (index) {
            return _BulletSlideControl(active: index == bulletActive);
          }),
        ),
        const Spacer(),
        IconButton.filled(
          onPressed: onNextSlide,
          icon: const Icon(Icons.arrow_forward),
          style: basePrimaryBtnStyle,
        ),
      ],
    );
  }
}

class _BulletSlideControl extends StatelessWidget {
  final bool active;

  const _BulletSlideControl({
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: active ? 14 : 12,
      height: active ? 14 : 12,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: active ? Coolors.dark : Coolors.grayLight,
        shape: BoxShape.circle,
      ),
    );
  }
}
