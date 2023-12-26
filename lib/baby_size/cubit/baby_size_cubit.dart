import 'package:baby_repository/baby_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:mom_baby_care/baby_size/cubit/baby_size_state.dart';
import 'package:uuid/uuid.dart';

class BabySizeCubit extends Cubit<BabySizeState> {
  BabySizeCubit({required BabyRepository babyRepository})
      : _babyRepository = babyRepository,
        super(BabySizeState.initial) {
    _babyRepository.streamBaby().listen((baby) {
      emit(state.copyWith(baby: baby));
    });
  }

  void changeHeight(double? height) {
    emit(state.copyWith(newHeight: height));
  }

  void changeWeight(double? weight) {
    emit(state.copyWith(newWeight: weight));
  }

  void changeHeadSize(double? headSize) {
    emit(state.copyWith(newHeadSize: headSize));
  }

  void changeDateTime(DateTime dateTime) {
    emit(state.copyWith(dateTime: dateTime));
  }

  void deleteSize(String id) {
    _babyRepository.deleteSize(id);
  }

  Future<void> saveSize() async {
    if (!state.isValid()) return;
    _babyRepository.addSize(BabySize(
      id: const Uuid().v1().toString(),
      height: state.newHeight!,
      weight: state.newWeight!,
      headSize: state.newHeadSize!,
      time: state.dateTime!,
    ));
  }

  final BabyRepository _babyRepository;
}
