import 'package:baby_repository/baby_repository.dart';

import '../db/baby_db.dart' as db;
import '../models/baby.dart' as domain;

extension BabyExt on db.BabyEntity {
  domain.Baby toDomainModel() {
    return domain.Baby(
        id: this.id.toString(),
        name: name,
        nickname: nickname,
        birthday: birthday,
        gender: domain.Gender.values.byName(gender));
  }
}

extension BabySizeExt on db.BabySizeEntity {
  BabySize toDomainModel() {
    return BabySize(
      id: id.toString(),
      headSize: headSize,
      height: height,
      weight: weight,
      time: time,
    );
  }
}
