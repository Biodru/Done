import 'package:done/features/bottom_bar/presentation/cubit/cubit/bottom_bar_cubit.dart';
import 'package:done/features/bottom_bar/presentation/widgets/bottom_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BottomBarCubit>();

    return Container(
      color: Colors.transparent,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomPaint(
            painter: _NotchedBottomBarPainter(
              bottomWidth: 60,
              bottomBarColor: Theme.of(context).colorScheme.primaryContainer,
              backgroundColor: Theme.of(context).colorScheme.background,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomBarButton(
                  buttonIndex: 0,
                  onTap: cubit.changeScreen,
                  currentIndex: cubit.state.pageIndex,
                  selectedIcon: Icons.list_alt,
                  unselectedIcon: Icons.list_alt_outlined,
                ),
                BottomBarButton(
                  buttonIndex: 1,
                  onTap: cubit.changeScreen,
                  currentIndex: cubit.state.pageIndex,
                  selectedIcon: Icons.notes,
                  unselectedIcon: Icons.notes_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NotchedBottomBarPainter extends CustomPainter {
  _NotchedBottomBarPainter({
    required this.bottomWidth,
    required this.bottomBarColor,
    required this.backgroundColor,
  });

  final double bottomWidth;
  final Color bottomBarColor;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()..color = bottomBarColor;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(
          const Offset(0, 0),
          Offset(size.width, size.height),
        ),
        const Radius.circular(16),
      ),
      backgroundPaint,
    );

    double holeWidth = bottomWidth + 10;
    double holeHeight = 50.0;

    double left = (size.width - holeWidth) / 2;
    double top = -25;
    double right = left + holeWidth;
    double bottom = top + holeHeight;

    Paint holePaint = Paint()..color = backgroundColor;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(left, top, right, bottom),
        const Radius.circular(16),
      ),
      holePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
