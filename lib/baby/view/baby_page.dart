import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mom_baby_care/baby/cubit/baby_cubit.dart';
import 'package:mom_baby_care/baby/cubit/baby_state.dart';
import 'package:mom_baby_care/baby_size/baby_size.dart';
import 'package:mom_baby_care/common/view/border.dart';
import 'package:mom_baby_care/consts/consts.dart';
import 'package:mom_baby_care/utils/date_time.dart';

class BabyPage extends StatelessWidget {
  const BabyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '❤ Baby ❤',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const _BabyName(),
                const SizedBox(height: 40),
                const _BabyAge(),
                const SizedBox(height: 40),
                const _BabySettings(),
                const SizedBox(height: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BabyName extends StatelessWidget {
  const _BabyName();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BabyCubit, BabyState>(
        buildWhen: (previous, current) =>
            previous.baby.name != current.baby.name,
        builder: (context, state) {
          final theme = Theme.of(context);
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: ClipRRect(
                  borderRadius: AppBorderRadius.medium,
                  child: Image.asset(AssetsImage.babyAvatar),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.medium,
                  color: theme.colorScheme.primaryContainer,
                ),
                child: Text(
                  'Hello, ${state.baby.nickname ?? state.baby.name}',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class _BabyAge extends StatelessWidget {
  const _BabyAge();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BabyCubit, BabyState>(
      buildWhen: (previous, current) =>
          previous.baby.birthDay != current.baby.birthDay,
      builder: (context, state) {
        final babyAge =
            DateTime.now().calculateTimeDifference(state.baby.birthDay);
        return Row(
          children: [
            _item(context, '${babyAge['years']} years'),
            const SizedBox(width: 12),
            _item(context, '${babyAge['months']} months'),
            const SizedBox(width: 12),
            _item(context, '${babyAge['days']} days'),
          ],
        );
      },
    );
  }

  Widget _item(BuildContext context, String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
          borderRadius: AppBorderRadius.medium,
        ),
        child: Text(text),
      ),
    );
  }
}

class _BabySettings extends StatelessWidget {
  const _BabySettings();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _item(
                context,
                label: 'Thông tin con yêu',
                image: AssetsImage.icNote,
              ),
              _item(
                context,
                label: 'Con yêu theo tháng tuổi',
                image: AssetsImage.icCalendar,
              ),
              _item(
                context,
                label: 'Số đo con yêu',
                image: AssetsImage.icWeight,
                onTap: () {
                  context.go('/${BabySizePage.route}');
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _item(
                context,
                label: 'Tuần khủng hoảng',
                image: AssetsImage.icCalendar2,
              ),
              _item(
                context,
                label: 'Lưu giữ khoảnh khắc',
                image: AssetsImage.icPhoto,
              ),
              _item(
                context,
                label: 'Shop mẹ và bé',
                image: AssetsImage.icShop,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    String label = '',
    String image = '',
    GestureTapCallback? onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(children: [
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.medium,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            child: Image.asset(image),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              label,
              textAlign: TextAlign.center,
            ),
          ),
        ]),
      ),
    );
  }
}
