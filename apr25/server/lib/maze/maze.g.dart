// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maze.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Maze _$MazeFromJson(Map<String, dynamic> json) => Maze(
      vertices: (json['vertices'] as List<dynamic>)
          .map((e) => _$recordConvert(
                e,
                ($jsonValue) => (
                  x: ($jsonValue['x'] as num).toInt(),
                  y: ($jsonValue['y'] as num).toInt(),
                ),
              ))
          .toList(),
      edges: (json['edges'] as List<dynamic>)
          .map((e) => _$recordConvert(
                e,
                ($jsonValue) => (
                  a: ($jsonValue['a'] as num).toInt(),
                  b: ($jsonValue['b'] as num).toInt(),
                ),
              ))
          .toList(),
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
    );

Map<String, dynamic> _$MazeToJson(Maze instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'vertices': instance.vertices
          .map((e) => <String, dynamic>{
                'x': e.x,
                'y': e.y,
              })
          .toList(),
      'edges': instance.edges
          .map((e) => <String, dynamic>{
                'a': e.a,
                'b': e.b,
              })
          .toList(),
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);
