// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      temperatureSensor1: (json['temperatura_LPS22HB'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
      pressure: (json['pressure'] as num?)?.toDouble(),
      temperatureSensor2: (json['temperatura_HTS221'] as num?)?.toDouble(),
      accelerometer: json['accelerometer'] == null
          ? null
          : Accelerometer.fromJson(
              json['accelerometer'] as Map<String, dynamic>),
      gyroAccelerometer: json['gyro_accelerometer'] == null
          ? null
          : GyroAccelerometer.fromJson(
              json['gyro_accelerometer'] as Map<String, dynamic>),
      angularVelocity: json['angular_velocity'] == null
          ? null
          : AngularVelocity.fromJson(
              json['angular_velocity'] as Map<String, dynamic>),
      heading: json['heading'] == null
          ? null
          : Heading.fromJson(json['heading'] as Map<String, dynamic>),
      numberOfSatellites: json['number_of_satellites'] as int?,
      gpsFix: json['gps_fix'] as int?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      altitude: (json['altitude'] as num?)?.toDouble(),
      gpsSpeed: (json['gps_speed'] as num?)?.toDouble(),
      time: json['time'] as int?,
      timeStamp: json['timeStamp'] as int?,
      rxRSSI: json['rx_rssi'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'temperatura_LPS22HB': instance.temperatureSensor1,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'temperatura_HTS221': instance.temperatureSensor2,
      'accelerometer': instance.accelerometer,
      'gyro_accelerometer': instance.gyroAccelerometer,
      'angular_velocity': instance.angularVelocity,
      'heading': instance.heading,
      'number_of_satellites': instance.numberOfSatellites,
      'gps_fix': instance.gpsFix,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'altitude': instance.altitude,
      'gps_speed': instance.gpsSpeed,
      'time': instance.time,
      'timeStamp': instance.timeStamp,
      'rx_rssi': instance.rxRSSI,
    };

Accelerometer _$AccelerometerFromJson(Map<String, dynamic> json) =>
    Accelerometer(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      z: (json['z'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AccelerometerToJson(Accelerometer instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

GyroAccelerometer _$GyroAccelerometerFromJson(Map<String, dynamic> json) =>
    GyroAccelerometer(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      z: (json['z'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GyroAccelerometerToJson(GyroAccelerometer instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

AngularVelocity _$AngularVelocityFromJson(Map<String, dynamic> json) =>
    AngularVelocity(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      z: (json['z'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AngularVelocityToJson(AngularVelocity instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

Heading _$HeadingFromJson(Map<String, dynamic> json) => Heading(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      z: (json['z'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HeadingToJson(Heading instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };
