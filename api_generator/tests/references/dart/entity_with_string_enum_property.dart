// Generated code. Do not modify.

import 'package:equatable/equatable.dart';

import '../utils/parsing_extensions.dart';

class EntityWithStringEnumProperty with EquatableMixin {
  const EntityWithStringEnumProperty({
    required this.property,
  });

  static const type = "entity_with_string_enum_property";

  final EntityWithStringEnumPropertyProperty property;

  @override
  List<Object?> get props => [
        property,
      ];

  static EntityWithStringEnumProperty? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EntityWithStringEnumProperty(
      property: EntityWithStringEnumPropertyProperty.fromJson(json['property'])!,
    );
  }
}

enum EntityWithStringEnumPropertyProperty {
  first('first'),
  second('second');

  final String value;

  const EntityWithStringEnumPropertyProperty(this.value);

  static EntityWithStringEnumPropertyProperty? fromJson(String? json) {
    if (json == null) {
      return null;
    }
    switch (json) {
      case 'first':
        return EntityWithStringEnumPropertyProperty.first;
      case 'second':
        return EntityWithStringEnumPropertyProperty.second;
    }
    return null;
  }
}
