part of 'wonder_week_page.dart';

class _StepWeeks extends StatelessWidget {
  const _StepWeeks();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<WonderWeekCubit, WonderWeekState>(
      builder: (context, state) {
        final wonderWeeks = state.wonderWeeks;
        return SizedBox(
          width: width,
          height: 950,
          child: Stack(
            children: [
              for (int row = 0; row <= 12; row++)
                for (int col = 0; col < 14; col++)
                  _stepItem(
                    context,
                    row,
                    col,
                    wonderWeeks,
                  ),
              for (int row = 0; row <= 12; row++)
                for (int col = 0; col < 7; col++)
                  _stepWeek(
                    context,
                    row,
                    col,
                    wonderWeeks,
                  ),
              _currentWeek(context, state.weekAge),
            ],
          ),
        );
      },
    );
  }

  Widget _stepItem(
    BuildContext context,
    int row,
    int col,
    List<WonderWeek> wonderWeeks,
  ) {
    final width = MediaQuery.of(context).size.width;
    final stepWidth = width / 16;
    final step = row * 14 + col;
    final isInWonderWeek = wonderWeeks.any(
        (element) => element.start <= step * 0.5 && element.end > step * 0.5);
    return Positioned(
      left: 16 + col * stepWidth,
      top: row * 70.0 + 50,
      child: Container(
        width: stepWidth,
        height: 20.0,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Theme.of(context).dividerColor),
            bottom:
                BorderSide(width: 1.0, color: Theme.of(context).dividerColor),
            left: col % 2 == 0
                ? BorderSide(width: 1.0, color: Theme.of(context).dividerColor)
                : BorderSide.none,
            right: col == 13
                ? BorderSide(width: 1.0, color: Theme.of(context).dividerColor)
                : BorderSide.none,
          ),
          color: isInWonderWeek
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }

  Widget _stepWeek(
    BuildContext context,
    int row,
    int col,
    List<WonderWeek> wonderWeeks,
  ) {
    final width = MediaQuery.of(context).size.width;
    final stepWidth = width / 8;
    final week = row * 7 + col;
    return Positioned(
        left: col * stepWidth + 13,
        top: row * 70.0 + 70,
        child: Text(
          week.toInt().toString(),
        ));
  }

  Widget _currentWeek(BuildContext context, double currentWeek) {
    final width = MediaQuery.of(context).size.width;
    final int row = currentWeek ~/ 7;
    return Positioned(
        left: (currentWeek % 7) * (width / 8),
        top: row * 70.0 + 15,
        child: Icon(
          Icons.location_pin,
          color: Theme.of(context).colorScheme.onSurface,
          size: 30,
        ));
  }
}
