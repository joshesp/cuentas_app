import 'package:cuentas_app/common/utils/fade_animation_util.dart';
import 'package:cuentas_app/common/widgets/widgets.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final List<SlideModel> sliderItems;
  final void Function() onActionEnd;

  const SliderWidget({
    super.key,
    required this.sliderItems,
    required this.onActionEnd,
  });

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final pageControl = PageController();
  int currentIndexSlide = 0;

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
          child: ButtonAppWidget(
            onPressed: widget.onActionEnd,
            text: 'Omitir',
            styleType: ButtonStyleType.clear,
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: pageControl,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.sliderItems.length,
            itemBuilder: (context, index) {
              final slide = widget.sliderItems[index];

              return FadeAnimationUtil(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 100),
                child: _SlideContent(slide: slide),
              );
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
          onActionEnd: widget.onActionEnd,
        )
      ],
    );
  }

  void onNextSlide() {
    if (currentIndexSlide == widget.sliderItems.length - 1) {
      widget.onActionEnd();
      return;
    }

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

  final SlideModel slide;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: maxSpacing),
        Image.asset(slide.image),
        const SizedBox(height: 64),
        Text(
          slide.title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: minSpacing),
        Text(
          slide.description,
          style: Theme.of(context).textTheme.bodyLarge,
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
  final void Function() onActionEnd;

  const _SliderNavigation({
    required this.totalBullets,
    required this.bulletActive,
    required this.onNextSlide,
    required this.onActionEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(totalBullets, (index) {
            return _BulletSlideControl(
              active: index == bulletActive,
            );
          }),
        ),
        const Spacer(),
        AnimatedCrossFade(
          firstChild: ButtonAppWidget(
            onPressed: onNextSlide,
            icon: Icons.arrow_forward,
          ),
          secondChild: ButtonAppWidget(
            onPressed: onNextSlide,
            text: 'Empezar',
          ),
          crossFadeState: totalBullets - 1 == bulletActive
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(
            milliseconds: 200,
          ),
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
        color: active ? Coolors.primaryDark : Coolors.gray.withOpacity(0.6),
        shape: BoxShape.circle,
      ),
    );
  }
}
