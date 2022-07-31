import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:vital_flutter/vital_resource.dart';

part 'sync_data.g.dart';

enum SyncStatusType {
  failedSyncing,
  successSyncing,
  nothingToSync,
  syncing,
  syncingCompleted,
  unknown,
}

abstract class SyncStatus {
  final SyncStatusType status;

  SyncStatus(this.status);
}

class SyncStatusFailed extends SyncStatus {
  final VitalResource resource;
  final String? error;

  SyncStatusFailed(this.resource, this.error) : super(SyncStatusType.failedSyncing);
}

class SyncStatusSuccessSyncing<T> extends SyncStatus {
  final VitalResource resource;
  final T data;

  SyncStatusSuccessSyncing(this.resource, this.data) : super(SyncStatusType.successSyncing);
}

class SyncStatusNothingToSync extends SyncStatus {
  final VitalResource resource;

  SyncStatusNothingToSync(this.resource) : super(SyncStatusType.nothingToSync);
}

class SyncStatusSyncing extends SyncStatus {
  final VitalResource resource;

  SyncStatusSyncing(this.resource) : super(SyncStatusType.syncing);
}

class SyncStatusCompleted extends SyncStatus {
  SyncStatusCompleted() : super(SyncStatusType.syncingCompleted);
}

class SyncStatusUnknown extends SyncStatus {
  SyncStatusUnknown() : super(SyncStatusType.unknown);
}

SyncStatus mapArgumentsToStatus(List<dynamic> arguments) {
  switch (arguments[0] as String) {
    case 'failedSyncing':
      return SyncStatusFailed(VitalResource.values.firstWhere((it) => it.name == arguments[1]), arguments[2]);
    case 'successSyncing':
      final resource = VitalResource.values.firstWhere((it) => it.name == arguments[1]);
      return SyncStatusSuccessSyncing(
        resource,
        fromArgument(resource, arguments[2]),
      );
    case 'nothingToSync':
      return SyncStatusNothingToSync(VitalResource.values.firstWhere((it) => it.name == arguments[1]));
    case 'syncing':
      return SyncStatusSyncing(VitalResource.values.firstWhere((it) => it.name == arguments[1]));
    case 'syncingCompleted':
      return SyncStatusCompleted();
    default:
      return SyncStatusUnknown();
  }
}

enum PostResourceDataType {
  activity,
  body,
  profile,
  sleep,
  workout,
  glucose,
  bloodPressure,
  hearthRate,
  unknown,
}

Object? fromArgument(VitalResource resource, String argument) {
  switch (resource) {
    case VitalResource.activity:
      return (jsonDecode(argument) as List).map((e) => ActivitySummary.fromJson(e)).toList();
    case VitalResource.profile:
      return ProfileSummary.fromJson(jsonDecode(argument));
    case VitalResource.body:
      return BodySummary.fromJson(jsonDecode(argument));
    case VitalResource.sleep:
      return (jsonDecode(argument) as List).map((e) => SleepSummary.fromJson(e)).toList();
    case VitalResource.workout:
      return (jsonDecode(argument) as List).map((e) => WorkoutSummary.fromJson(e)).toList();
    case VitalResource.glucose:
      return (jsonDecode(argument) as List).map((e) => QuantitySample.fromJson(e)).toList();
    case VitalResource.bloodPressure:
      return (jsonDecode(argument) as List).map((e) => BloodPressureSample.fromJson(e)).toList();
    case VitalResource.heartRate:
      return (jsonDecode(argument) as List).map((e) => QuantitySample.fromJson(e)).toList();
    default:
      return null;
  }
}

@JsonSerializable()
class ActivitySummary {
  final DateTime date;
  final List<QuantitySample> activeEnergyBurned;
  final List<QuantitySample> basalEnergyBurned;
  final List<QuantitySample> steps;
  final List<QuantitySample> floorsClimbed;
  final List<QuantitySample> distanceWalkingRunning;
  final List<QuantitySample> vo2Max;

  ActivitySummary({
    required this.date,
    this.activeEnergyBurned = const [],
    this.basalEnergyBurned = const [],
    this.steps = const [],
    this.floorsClimbed = const [],
    this.distanceWalkingRunning = const [],
    this.vo2Max = const [],
  });

  factory ActivitySummary.fromJson(Map<String, dynamic> json) => _$ActivitySummaryFromJson(json);
}

@JsonSerializable()
class BodySummary {
  final List<QuantitySample> bodyMass;
  final List<QuantitySample> bodyFatPercentage;

  BodySummary({this.bodyMass = const [], this.bodyFatPercentage = const []});

  factory BodySummary.fromJson(Map<String, dynamic> json) => _$BodySummaryFromJson(json);
}

@JsonSerializable()
class QuantitySample {
  final String? id;
  final double value;
  final DateTime startDate;
  final DateTime endDate;
  final String? sourceBundle;
  final String? type;
  final String unit;

  QuantitySample({
    this.id,
    required this.value,
    required this.startDate,
    required this.endDate,
    this.sourceBundle,
    this.type,
    required this.unit,
  });

  factory QuantitySample.fromJson(Map<String, dynamic> json) => _$QuantitySampleFromJson(json);
}

@JsonSerializable()
class SleepSummary {
  final String? id;
  final DateTime startDate;
  final DateTime endDate;
  final String sourceBundle;

  final List<QuantitySample> heartRate;
  final List<QuantitySample> restingHeartRate;
  final List<QuantitySample> heartRateVariability;
  final List<QuantitySample> oxygenSaturation;
  final List<QuantitySample> respiratoryRate;

  SleepSummary({
    this.id,
    required this.startDate,
    required this.endDate,
    required this.sourceBundle,
    this.heartRate = const [],
    this.restingHeartRate = const [],
    this.heartRateVariability = const [],
    this.oxygenSaturation = const [],
    this.respiratoryRate = const [],
  });

  factory SleepSummary.fromJson(Map<String, dynamic> json) => _$SleepSummaryFromJson(json);
}

@JsonSerializable()
class WorkoutSummary {
  final String? id;
  final DateTime startDate;
  final DateTime endDate;
  final String sourceBundle;
  final String sport;
  final double calories;
  final double distance;

  final List<QuantitySample> heartRate;
  final List<QuantitySample> respiratoryRate;

  WorkoutSummary({
    this.id,
    required this.startDate,
    required this.endDate,
    required this.sourceBundle,
    required this.sport,
    required this.calories,
    required this.distance,
    this.heartRate = const [],
    this.respiratoryRate = const [],
  });

  factory WorkoutSummary.fromJson(Map<String, dynamic> json) => _$WorkoutSummaryFromJson(json);
}

@JsonSerializable()
class BloodPressureSample {
  final QuantitySample systolic;
  final QuantitySample diastolic;
  final QuantitySample? pulse;

  BloodPressureSample({
    required this.systolic,
    required this.diastolic,
    this.pulse,
  });

  factory BloodPressureSample.fromJson(Map<String, dynamic> json) => _$BloodPressureSampleFromJson(json);
}

enum BiologicalSex {
  male,
  female,
  other,
  notSet,
}

@JsonSerializable()
class ProfileSummary {
  final BiologicalSex biologicalSex;
  final DateTime? dateOfBirth;
  final int? height;

  ProfileSummary({
    this.biologicalSex = BiologicalSex.notSet,
    this.dateOfBirth,
    this.height,
  });

  factory ProfileSummary.fromJson(Map<String, dynamic> json) => _$ProfileSummaryFromJson(json);
}
