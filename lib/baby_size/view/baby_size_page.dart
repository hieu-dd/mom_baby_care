import 'package:data_table_2/data_table_2.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child:
                  DataTable2(columnSpacing: 12, horizontalMargin: 12, columns: [
                _tableSizeTitle('Chiều cao'),
                _tableSizeTitle('Cân nặng'),
                _tableSizeTitle('Vòng đầu'),
                _tableSizeTitle('Thòi điểm'),
              ], rows: [
                ...cubit.state.baby.sizes.map((size) => DataRow(cells: [
                      _tableSizeCell(size.height),
                      _tableSizeCell(size.weight),
                      _tableSizeCell(size.headSize),
                      _tableSizeCell(size.time.calculateTimeDifferenceInString(
                          cubit.state.baby.birthDay)),
                    ])),
              ]),
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

  DataColumn2 _tableSizeTitle(String label) {
    return DataColumn2(
      label: Text(
        label,
        maxLines: 2,
      ),
      size: ColumnSize.S,
    );
  }

  DataCell _tableSizeCell(dynamic value) {
    return DataCell(Text(
      value.toString(),
    ));
  }
}
