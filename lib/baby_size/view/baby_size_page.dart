import 'package:baby_repository/baby_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_baby_care/baby_size/cubit/baby_size_cubit.dart';
import 'package:mom_baby_care/common/view/text_field_date_time.dart';
import 'package:mom_baby_care/utils/date_time.dart';

part 'add_baby_size_alert.dart';

class BabySizePage extends StatelessWidget {
  static const route = 'baby_size_route';

  const BabySizePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BabySizeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Số đo con yêu'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ...cubit.state.baby.sizes.map((e) => _BabySizeItem(
                    size: e,
                    baby: cubit.state.baby,
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          _showInputPopup(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _BabySizeItem extends StatelessWidget {
  const _BabySizeItem({required BabySize size, required Baby baby})
      : _size = size,
        _baby = baby;

  final BabySize _size;
  final Baby _baby;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          'Chiều cao: ${_size.height} cm\nCân nặng: ${_size.weight} kg\nVòng đầu: ${_size.headSize}'),
      subtitle:
          Text(_size.time.calculateTimeDifferenceInString(_baby.birthDay)),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
