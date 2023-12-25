import 'package:baby_repository/baby_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:mom_baby_care/baby/cubit/baby_state.dart';

class BabyCubit extends Cubit<BabyState> {
  BabyCubit({required BabyRepository babyRepository})
      : _babyRepository = babyRepository,
        super(BabyState.initial) {
    _babyRepository.streamBaby().listen((baby) {
      emit(state.copyWith(baby));
    });
  }

  final BabyRepository _babyRepository;
}
