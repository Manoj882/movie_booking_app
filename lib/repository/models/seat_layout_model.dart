import 'dart:convert';

import 'package:flutter/foundation.dart';

class SeatLayoutModel {
  final int rows;
  final int columns;
  final List<Map<String, dynamic>> seatTypes;
  final int theatreId;
  final int gap;
  final int gapColumnIndex;
  final bool isLastFilled;
  final List<int> rowBreaks;

  SeatLayoutModel({
    required this.rows,
    required this.columns,
    required this.seatTypes,
    required this.theatreId,
    required this.gap,
    required this.gapColumnIndex,
    required this.isLastFilled,
    required this.rowBreaks,
  });

  SeatLayoutModel copyWith({
    int? rows,
    int? columns,
    List<Map<String, dynamic>>? seatTypes,
    int? theatreId,
    int? gap,
    int? gapColumnIndex,
    bool? isLastFilled,
    List<int>? rowBreaks,
  }) {
    return SeatLayoutModel(
      rows: rows ?? this.rows,
      columns: columns ?? this.columns,
      seatTypes: seatTypes ?? this.seatTypes,
      theatreId: theatreId ?? this.theatreId,
      gap: gap ?? this.gap,
      gapColumnIndex: gapColumnIndex ?? this.gapColumnIndex,
      isLastFilled: isLastFilled ?? this.isLastFilled,
      rowBreaks: rowBreaks ?? this.rowBreaks,
    );
  }

  factory SeatLayoutModel.fromMap(Map<String, dynamic> map) {
    return SeatLayoutModel(
      rows: map['rows'] ?? 0,
      columns: map['columns'] ?? 0,
      seatTypes:
          List<Map<String, dynamic>>.from(map['seatTypes']?.map((x) => x)),
      theatreId: map['theatreId'] ?? 0,
      gap: map['gap'] ?? 0,
      gapColumnIndex: map['gapColumnIndex'] ?? 0,
      isLastFilled: map['isLastFilled'] ?? false,
      rowBreaks: List<int>.from(map['rowBreaks']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rows': rows,
      'columns': columns,
      'seatTypes': seatTypes,
      'theatreId': theatreId,
      'gap': gap,
      'gapColumnIndex': gapColumnIndex,
      'isLastFilled': isLastFilled,
      'rowBreaks': rowBreaks,
    };
  }

  String toJson() => json.encode(toMap());

  factory SeatLayoutModel.fromJson(String source) =>
      SeatLayoutModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SeatLayoutModel(rows: $rows, cols: $columns, seatTypes: $seatTypes, theatreId: $theatreId, gap: $gap, gapColIndex: $gapColumnIndex, isLastFilled: $isLastFilled, rowBreaks: $rowBreaks,)';
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SeatLayoutModel &&
      other.rows == rows &&
      other.columns == columns &&
      listEquals(other.seatTypes, seatTypes) &&
      other.theatreId == theatreId &&
      other.gap == gap &&
      other.gapColumnIndex == gapColumnIndex &&
      other.isLastFilled == isLastFilled &&
      listEquals(other.rowBreaks, rowBreaks);
  }

  @override
  int get hashCode {
    return rows.hashCode ^
      columns.hashCode ^
      seatTypes.hashCode ^
      theatreId.hashCode ^
      gap.hashCode ^
      gapColumnIndex.hashCode ^
      isLastFilled.hashCode ^
      rowBreaks.hashCode;
}
}
