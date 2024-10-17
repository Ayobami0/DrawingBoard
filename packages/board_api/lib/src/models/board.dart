import 'package:freezed_annotation/freezed_annotation.dart';

part 'board.freezed.dart';

typedef BoardID = String;

@freezed
class Board with _$Board {
  const factory Board({
    required String name,
    required BoardID id,
  }) = _Board;
}
