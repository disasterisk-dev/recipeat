import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recipeat/components/text_widgets.dart';
import 'package:recipeat/theme.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    super.key,
    required this.text,
    required this.bgColor,
    required this.width,
    required this.height,
    required this.onTap,
    required this.icon,
  });

  final String text;
  final Color bgColor;
  final IconData icon;
  final int width;
  final int height;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: width,
      mainAxisCellCount: height,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: bgColor,
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Opacity(
                opacity: 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage("assets/img/pizza.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 4,
                children: [
                  Icon(
                    icon,
                    color: AppColors.inverse,
                    size: 48,
                    shadows: [
                      Shadow(
                        blurRadius: 8,
                        color: AppColors.boldMuted,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  Center(child: InverseHeadingText(text)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
