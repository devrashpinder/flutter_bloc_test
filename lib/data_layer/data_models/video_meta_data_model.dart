import 'package:json_annotation/json_annotation.dart';

part 'video_meta_data_model.g.dart';

@JsonSerializable()
class VideoMetaDataModel {
  VideoMetaDataModel({
    this.data,
    this.hasMore,
  });

  List<VideoMetaData>? data;
  bool? hasMore;

  factory VideoMetaDataModel.fromJson(Map<String, dynamic> json) =>
      _$VideoMetaDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$VideoMetaDataModelToJson(this);
}

@JsonSerializable()
class VideoMetaData {
  VideoMetaData({
    this.bearing,
    this.datetime,
    this.distanceFromLast,
    this.gpsStatus,
    this.lat,
    this.lon,
    this.speed,
    this.xAcc,
    this.yAcc,
    this.zAcc,
  });

  double? bearing;
  DateTime? datetime;
  double? distanceFromLast;
  String? gpsStatus;
  double? lat;
  double? lon;
  double? speed;
  double? xAcc;
  double? yAcc;
  double? zAcc;

  factory VideoMetaData.fromJson(Map<String, dynamic> json) =>
      _$VideoMetaDataFromJson(json);
  Map<String, dynamic> toJson() => _$VideoMetaDataToJson(this);
}
