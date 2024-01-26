import 'package:baby_repository/baby_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:mom_baby_care/wonder_week/cubit/wonder_week_state.dart';

class WonderWeekCubit extends Cubit<WonderWeekState> {
  final BabyRepository _babyRepository;

  WonderWeekCubit({required BabyRepository babyRepository})
      : _babyRepository = babyRepository,
        super(WonderWeekState.empty) {
    _babyRepository.streamBaby().listen(_changeBaby);
  }

  void _changeBaby(Baby baby) {
    emit(WonderWeekState(baby: baby));
  }

  void changeDueDate(DateTime dueDate) {
    _babyRepository.updateDueDate(dueDate);
  }
}
