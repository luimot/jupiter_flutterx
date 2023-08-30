import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

// Note: Must run to generate files:
// flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class Data {
  // JsonKey annotation is used to drift from dart's standard camelCase

  // Sensor data
  @JsonKey(name: 'temperatura_LPS22HB')
  double? temperatureSensor1;
  double? humidity;
  double? pressure;
  @JsonKey(name: 'temperatura_HTS221')
  double? temperatureSensor2;
  Accelerometer? accelerometer;
  @JsonKey(name: 'gyro_accelerometer')
  GyroAccelerometer? gyroAccelerometer;
  @JsonKey(name: 'angular_velocity')
  AngularVelocity? angularVelocity;
  Heading? heading;

  // GPS Data
  @JsonKey(name: 'number_of_satellites')
  int? numberOfSatellites;
  @JsonKey(name: 'gps_fix')
  int? gpsFix;
  double? latitude;
  double? longitude;
  double? altitude;
  @JsonKey(name: 'gps_speed')
  double? gpsSpeed;

  // Generic
  int? time;
  int? timeStamp;

  //Signal
  @JsonKey(name: 'rx_rssi')
  int? rxRSSI;

  Data({
    this.temperatureSensor1,
    this.humidity,
    this.pressure,
    this.temperatureSensor2,
    this.accelerometer,
    this.gyroAccelerometer,
    this.angularVelocity,
    this.heading,
    this.numberOfSatellites,
    this.gpsFix,
    this.latitude,
    this.longitude,
    this.altitude,
    this.gpsSpeed,
    this.time,
    this.timeStamp,
    this.rxRSSI,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Accelerometer {
  double? x;
  double? y;
  double? z;
  Accelerometer({this.x, this.y, this.z});

  factory Accelerometer.fromJson(Map<String, dynamic> json) =>
      _$AccelerometerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccelerometerToJson(this);
}

@JsonSerializable()
class GyroAccelerometer {
  double? x;
  double? y;
  double? z;
  GyroAccelerometer({this.x, this.y, this.z});

  factory GyroAccelerometer.fromJson(Map<String, dynamic> json) =>
      _$GyroAccelerometerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GyroAccelerometerToJson(this);
}

@JsonSerializable()
class AngularVelocity {
  double? x;
  double? y;
  double? z;
  AngularVelocity({this.x, this.y, this.z});

  factory AngularVelocity.fromJson(Map<String, dynamic> json) =>
      _$AngularVelocityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AngularVelocityToJson(this);
}

@JsonSerializable()
class Heading {
  double? x;
  double? y;
  double? z;
  Heading({this.x, this.y, this.z});

  factory Heading.fromJson(Map<String, dynamic> json) =>
      _$HeadingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$HeadingToJson(this);
}
