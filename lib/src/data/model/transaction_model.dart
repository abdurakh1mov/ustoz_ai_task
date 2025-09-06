import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/serializer/serializer.dart';

part 'transaction_model.g.dart';

abstract class TransactionModel
    implements Built<TransactionModel, TransactionModelBuilder> {
  TransactionModel._();
  factory TransactionModel([void Function(TransactionModelBuilder) updates]) =
      _$TransactionModel;
  @BuiltValueField(wireName: "amount")
  String get amount;
  @BuiltValueField(wireName: "id")
  String get id;
  @BuiltValueField(wireName: "category")
  String get category;
  @BuiltValueField(wireName: "createdAt")
  Timestamp get createdAt;
  @BuiltValueField(wireName: "income")
  bool get income;
  @BuiltValueField(wireName: "isUsd")
  bool get isUsd;
  @BuiltValueField(wireName: "note")
  String get note;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(TransactionModel.serializer, this)
        as Map<String, dynamic>;
  }

  static TransactionModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TransactionModel.serializer, json)!;
  }

  static Serializer<TransactionModel> get serializer =>
      _$transactionModelSerializer;
}

class TimestampSerializer implements PrimitiveSerializer<Timestamp> {
  @override
  final Iterable<Type> types = const [Timestamp];
  @override
  final String wireName = 'Timestamp';

  @override
  Object serialize(
    Serializers serializers,
    Timestamp timestamp, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return timestamp.millisecondsSinceEpoch;
  }

  @override
  Timestamp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    if (serialized is int) {
      return Timestamp.fromMillisecondsSinceEpoch(serialized);
    } else if (serialized is Timestamp) {
      return serialized;
    }
    throw ArgumentError('Unsupported format for Timestamp: $serialized');
  }
}
