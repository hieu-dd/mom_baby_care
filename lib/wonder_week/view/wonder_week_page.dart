import 'package:baby_repository/baby_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_baby_care/utils/date_time.dart';
import 'package:mom_baby_care/utils/string.dart';
import 'package:mom_baby_care/wonder_week/cubit/wonder_week_cubit.dart';
import 'package:mom_baby_care/wonder_week/cubit/wonder_week_state.dart';
import 'package:mom_baby_care/wonder_week/wonder_week.dart';

part '../widget/update_due_date_button.dart';
part 'step_week.dart';

class WonderWeekPage extends StatelessWidget {
  const WonderWeekPage({super.key});

  @override
  Widget build(BuildContext context) {
    final babyRepository = context.read<BabyRepository>();
    return BlocProvider(
      create: (_) => WonderWeekCubit(babyRepository: babyRepository),
      child: const _WonderWeekPage(),
    );
  }
}

class _WonderWeekPage extends StatelessWidget {
  const _WonderWeekPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tuần khủng hoảng'),
        actions: [
          _UpdateDueDateAction(selectDate: (DateTime dueDate) {
            context.read<WonderWeekCubit>().changeDueDate(dueDate);
          })
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const _DueDateInfo(),
              const _StepWeeks(),
              _descriptionWeek(context, true),
              const SizedBox(
                height: 10,
              ),
              _descriptionWeek(context, false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _descriptionWeek(BuildContext context, bool isInWonderWeek) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: theme.dividerColor,
              ),
              color: isInWonderWeek
                  ? theme.colorScheme.primary
                  : theme.colorScheme.background,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              isInWonderWeek
                  ? 'Con sẽ trở nên cực kì khó tính trong những ngày này'
                  : 'Thời kì bình yên của bạn và con yêu',
              maxLines: 2,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _DueDateInfo extends StatelessWidget {
  const _DueDateInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WonderWeekCubit, WonderWeekState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Text(
                  'Dự sinh: '.hardcoded(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  state.dueDate.formatDayMonthYear(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
