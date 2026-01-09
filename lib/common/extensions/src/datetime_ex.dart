import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart';

extension DateTimeEx on DateTime {
  Timestamp toTimestamp() {
    return Timestamp.fromDateTime(this);
  }
}
