// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maze.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$MazeToJson(Maze instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'vertices': instance.vertices.map((e) => e.toJson()).toList(),
      'edges': instance.edges.map((e) => e.toJson()).toList(),
      'renderedCellCodes': instance.renderedCellCodes,
    };
