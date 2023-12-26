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
    emit(BabySizeState(
      baby: state.baby,
      newHeadSize: state.newHeadSize,
      newHeight: height,
      newWeight: state.newWeight,
      dateTime: state.dateTime,
    ));
  }

  void changeWeight(double? weight) {
    emit(BabySizeState(
      baby: state.baby,
      newHeadSize: state.newHeadSize,
      newHeight: state.newHeight,
      newWeight: weight,
      dateTime: state.dateTime,
    ));
  }

  void changeHeadSize(double? headSize) {
    emit(BabySizeState(
      baby: state.baby,
      newHeadSize: headSize,
      newHeight: state.newHeight,
      newWeight: state.newWeight,
      dateTime: state.dateTime,
    ));
  }

  void changeDateTime(DateTime dateTime) {
    emit(BabySizeState(
      baby: state.baby,
      newHeadSize: state.newHeadSize,
      newHeight: state.newHeight,
      newWeight: state.newWeight,
      dateTime: dateTime,
    ));
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
