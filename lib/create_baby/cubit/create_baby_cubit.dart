import 'package:baby_repository/baby_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:mom_baby_care/create_baby/cubit/create_baby_state.dart';
import 'package:uuid/uuid.dart';

class CreateBabyCubit extends Cubit<CreateBabState> {
  CreateBabyCubit({required BabyRepository babyRepository})
      : _babyRepository = babyRepository,
        super(CreateBabState.empty);

  final BabyRepository _babyRepository;

  void changeName(String name) {
    emit(state.copyWith(name: name));
  }

  void changeNickname(String nickname) {
    emit(state.copyWith(nickname: nickname));
  }

  void changeBirthday(DateTime birthday) {
    emit(state.copyWith(birthday: birthday));
  }

  void changeGender(String gender) {
    emit(state.copyWith(gender: Gender.values.byName(gender)));
  }

  Future<void> createBaby() async {
    if (!state.isValid) return;
    _babyRepository.saveBaby(Baby(
      id: const Uuid().v1().toString(),
      name: state.name,
      nickname: state.nickname,
      birthDay: state.birthday!,
      gender: state.gender,
    ));
  }
}
