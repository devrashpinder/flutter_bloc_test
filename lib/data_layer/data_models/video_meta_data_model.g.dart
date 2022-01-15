// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_meta_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoMetaDataModel _$VideoMetaDataModelFromJson(Map<String, dynamic> json) =>
    VideoMetaDataModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => VideoMetaData.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['hasMore'] as bool?,
    );

Map<String, dynamic> _$VideoMetaDataModelToJson(VideoMetaDataModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'hasMore': instance.hasMore,
    };

VideoMetaData _$VideoMetaDataFromJson(Map<String, dynamic> json) =>
    VideoMetaData(
      bearing: (json['bearing'] as num?)?.toDouble(),
      datetime: json['datetime'] == null
          ? null
          : DateTime.parse(json['datetime'] as String),
      distanceFromLast: (json['distanceFromLast'] as num?)?.toDouble(),
      gpsStatus: json['gpsStatus'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
      xAcc: (json['xAcc'] as num?)?.toDouble(),
      yAcc: (json['yAcc'] as num?)?.toDouble(),
      zAcc: (json['zAcc'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VideoMetaDataToJson(VideoMetaData instance) =>
    <String, dynamic>{
      'bearing': instance.bearing,
      'datetime': instance.datetime?.toIso8601String(),
      'distanceFromLast': instance.distanceFromLast,
      'gpsStatus': instance.gpsStatus,
      'lat': instance.lat,
      'lon': instance.lon,
      'speed': instance.speed,
      'xAcc': instance.xAcc,
      'yAcc': instance.yAcc,
      'zAcc': instance.zAcc,
    };
