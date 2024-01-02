import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_baby_care/baby_size/cubit/baby_size_cubit.dart';
import 'package:mom_baby_care/baby_size/cubit/baby_size_state.dart';
import 'package:mom_baby_care/common/view/text_field_date_time.dart';
import 'package:mom_baby_care/utils/date_time.dart';
import 'package:mom_baby_care/utils/list.dart';

part 'add_baby_size_alert.dart';

class BabySizePage extends StatelessWidget {
  const BabySizePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Số đo con yêu'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: _TableSize(),
            ),
          ],
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

class _TableSize extends StatelessWidget {
  const _TableSize();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BabySizeCubit, BabySizeState>(
      builder: (context, state) {
        return DataTable2(
          columnSpacing: 8,
          horizontalMargin: 0,
          smRatio: 0.5,
          lmRatio: 1.0,
          columns: [
            _tableSizeTitle('Chiều cao'),
            _tableSizeTitle('Cân nặng'),
            _tableSizeTitle('Vòng đầu'),
            _tableSizeTitle('Thòi điểm'),
            const DataColumn2(label: Text(''), size: ColumnSize.S),
          ],
          rows: [
            ...state.baby.sizes
                .sortedBy((a, b) => a.time.isBefore(b.time))
                .map((size) => DataRow(cells: [
                      _tableSizeCell(size.height),
                      _tableSizeCell(size.weight),
                      _tableSizeCell(size.headSize),
                      _tableSizeCell(
                        size.time.calculateTimeDifferenceInString(
                            state.baby.birthday),
                      ),
                      DataCell(
                        InkWell(
                          onTap: () {
                            context.read<BabySizeCubit>().deleteSize(size.id);
                          },
                          child: const Icon(Icons.delete),
                        ),
                      ),
                    ])),
          ],
        );
      },
    );
  }

  DataColumn2 _tableSizeTitle(String label) {
    return DataColumn2(
      label: Text(
        label,
        maxLines: 2,
      ),
      size: ColumnSize.L,
    );
  }

  DataCell _tableSizeCell(dynamic value) {
    return DataCell(Text(
      value.toString(),
    ));
  }
}
