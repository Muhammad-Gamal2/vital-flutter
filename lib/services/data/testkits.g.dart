// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testkits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) =>
    CreateOrderRequest(
      testkitId: json['testkit_id'] as String,
      userId: json['user_id'] as String,
      patientAddress: PatientAddress.fromJson(
          json['patient_address'] as Map<String, dynamic>),
      patientDetails: PatientDetails.fromJson(
          json['patient_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateOrderRequestToJson(CreateOrderRequest instance) =>
    <String, dynamic>{
      'testkit_id': instance.testkitId,
      'patient_address': instance.patientAddress,
      'patient_details': instance.patientDetails,
      'user_id': instance.userId,
    };

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      status: json['status'] as String?,
      order: json['order'] == null
          ? null
          : OrderData.fromJson(json['order'] as Map<String, dynamic>),
    )..message = json['message'] as String?;

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'order': instance.order,
    };

OrdersResponse _$OrdersResponseFromJson(Map<String, dynamic> json) =>
    OrdersResponse(
      orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => OrderData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$OrdersResponseToJson(OrdersResponse instance) =>
    <String, dynamic>{
      'orders': instance.orders,
    };

TestkitsResponse _$TestkitsResponseFromJson(Map<String, dynamic> json) =>
    TestkitsResponse(
      testkits: (json['testkits'] as List<dynamic>?)
              ?.map((e) => Testkit.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TestkitsResponseToJson(TestkitsResponse instance) =>
    <String, dynamic>{
      'testkits': instance.testkits,
    };

OrderData _$OrderDataFromJson(Map<String, dynamic> json) => OrderData(
      userId: json['user_id'] as String?,
      userKey: json['user_key'] as String?,
      id: json['id'] as String?,
      teamId: json['team_id'] as String?,
      createdOn: json['created_on'] == null
          ? null
          : DateTime.parse(json['created_on'] as String),
      updatedOn: json['updated_on'] == null
          ? null
          : DateTime.parse(json['updated_on'] as String),
      status: json['status'] as String?,
      testkitId: json['testkit_id'] as String?,
      testkit: json['testkit'] == null
          ? null
          : Testkit.fromJson(json['testkit'] as Map<String, dynamic>),
      inboundTrackingNumber: json['inbound_tracking_number'] as String?,
      outboundTrackingNumber: json['outbound_tracking_number'] as String?,
      inboundTrackingUrl: json['inbound_tracking_url'] as String?,
      outboundTrackingUrl: json['outbound_tracking_url'] as String?,
      outboundCourier: json['outbound_courier'] as String?,
      inboundCourier: json['inbound_courier'] as String?,
      patientAddress: json['patient_address'] == null
          ? null
          : PatientAddress.fromJson(
              json['patient_address'] as Map<String, dynamic>),
      patientDetails: json['patient_details'] == null
          ? null
          : PatientDetails.fromJson(
              json['patient_details'] as Map<String, dynamic>),
      sampleId: json['sample_id'] as String?,
    );

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'user_id': instance.userId,
      'user_key': instance.userKey,
      'id': instance.id,
      'team_id': instance.teamId,
      'created_on': instance.createdOn?.toIso8601String(),
      'updated_on': instance.updatedOn?.toIso8601String(),
      'status': instance.status,
      'testkit_id': instance.testkitId,
      'testkit': instance.testkit,
      'inbound_tracking_number': instance.inboundTrackingNumber,
      'outbound_tracking_number': instance.outboundTrackingNumber,
      'inbound_tracking_url': instance.inboundTrackingUrl,
      'outbound_tracking_url': instance.outboundTrackingUrl,
      'outbound_courier': instance.outboundCourier,
      'inbound_courier': instance.inboundCourier,
      'patient_address': instance.patientAddress,
      'patient_details': instance.patientDetails,
      'sample_id': instance.sampleId,
    };

Testkit _$TestkitFromJson(Map<String, dynamic> json) => Testkit(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      markers: (json['markers'] as List<dynamic>?)
              ?.map((e) => TestkitMarker.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      turnaroundTimeLower: json['turnaround_time_lower'] as int?,
      turnaroundTimeUpper: json['turnaround_time_upper'] as int?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TestkitToJson(Testkit instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'markers': instance.markers,
      'turnaround_time_lower': instance.turnaroundTimeLower,
      'turnaround_time_upper': instance.turnaroundTimeUpper,
      'price': instance.price,
    };

TestkitMarker _$TestkitMarkerFromJson(Map<String, dynamic> json) =>
    TestkitMarker(
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TestkitMarkerToJson(TestkitMarker instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
    };

PatientAddress _$PatientAddressFromJson(Map<String, dynamic> json) =>
    PatientAddress(
      receiverName: json['receiver_name'] as String?,
      street: json['street'] as String?,
      streetNumber: json['street_number'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      zip: json['zip'] as String?,
      country: json['country'] as String?,
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$PatientAddressToJson(PatientAddress instance) =>
    <String, dynamic>{
      'receiver_name': instance.receiverName,
      'street': instance.street,
      'street_number': instance.streetNumber,
      'city': instance.city,
      'state': instance.state,
      'zip': instance.zip,
      'country': instance.country,
      'phone_number': instance.phoneNumber,
    };

PatientDetails _$PatientDetailsFromJson(Map<String, dynamic> json) =>
    PatientDetails(
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      gender: json['gender'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$PatientDetailsToJson(PatientDetails instance) =>
    <String, dynamic>{
      'dob': instance.dob?.toIso8601String(),
      'gender': instance.gender,
      'email': instance.email,
    };
