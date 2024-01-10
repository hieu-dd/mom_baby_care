import '../db/baby_db.dart' as db;
import '../models/baby.dart' as domain;

extension BabyExt on db.Baby {
  domain.Baby toDomainModel() {
    return domain.Baby(
        id: this.id.toString(),
        name: name,
        nickname: nickname,
        birthday: birthday,
        gender: domain.Gender.values.byName(gender));
  }
}
