import 'package:baby_repository/baby_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:mom_baby_care/baby_info/cubit/baby_info_state.dart';

class BabyInfoCubit extends Cubit<BabyInfoState> {
  BabyInfoCubit({required BabyRepository babyRepository})
      : _babyRepository = babyRepository,
        super(BabyInfoState.empty) {
    _babyRepository.streamBaby().listen(_changeBaby);
  }

  final BabyRepository _babyRepository;

  void _changeBaby(Baby baby) {
    emit(state.copyWith(
      baby: baby,
      name: baby.name,
      nickname: baby.nickname,
      gender: baby.gender,
      birthday: baby.birthday,
    ));
  }

  void changeName(String name) {
    emit(state.copyWith(name: name));
  }

  void changeNickname(String nickname) {
    emit(state.copyWith(nickname: nickname));
  }

  void changeGender(String gender) {
    emit(state.copyWith(gender: Gender.values.byName(gender)));
  }

  void changeBirthday(DateTime birthday) {
    emit(state.copyWith(birthday: birthday));
  }

  void save() async {
    await _babyRepository.saveBaby(state.baby.copyWith(
      name: state.name,
      nickname: state.nickname,
      birthday: state.birthday,
      gender: state.gender,
    ));
  }
}
