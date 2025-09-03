import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:ustoz_ai_task/src/data/model/transaction_model.dart';

part "serializer.g.dart";

@SerializersFor([
  // Add your model here
  TransactionModel,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
