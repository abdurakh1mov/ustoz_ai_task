// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransactionModel> _$transactionModelSerializer =
    _$TransactionModelSerializer();

class _$TransactionModelSerializer
    implements StructuredSerializer<TransactionModel> {
  @override
  final Iterable<Type> types = const [TransactionModel, _$TransactionModel];
  @override
  final String wireName = 'TransactionModel';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    TransactionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'amount',
      serializers.serialize(
        object.amount,
        specifiedType: const FullType(String),
      ),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'category',
      serializers.serialize(
        object.category,
        specifiedType: const FullType(String),
      ),
      'createdAt',
      serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(Timestamp),
      ),
      'income',
      serializers.serialize(object.income, specifiedType: const FullType(bool)),
      'isUsd',
      serializers.serialize(object.isUsd, specifiedType: const FullType(bool)),
      'note',
      serializers.serialize(object.note, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  TransactionModel deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TransactionModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'amount':
          result.amount =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'id':
          result.id =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'category':
          result.category =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'createdAt':
          result.createdAt =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(Timestamp),
                  )!
                  as Timestamp;
          break;
        case 'income':
          result.income =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )!
                  as bool;
          break;
        case 'isUsd':
          result.isUsd =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )!
                  as bool;
          break;
        case 'note':
          result.note =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TransactionModel extends TransactionModel {
  @override
  final String amount;
  @override
  final String id;
  @override
  final String category;
  @override
  final Timestamp createdAt;
  @override
  final bool income;
  @override
  final bool isUsd;
  @override
  final String note;

  factory _$TransactionModel([
    void Function(TransactionModelBuilder)? updates,
  ]) => (TransactionModelBuilder()..update(updates))._build();

  _$TransactionModel._({
    required this.amount,
    required this.id,
    required this.category,
    required this.createdAt,
    required this.income,
    required this.isUsd,
    required this.note,
  }) : super._();
  @override
  TransactionModel rebuild(void Function(TransactionModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionModelBuilder toBuilder() =>
      TransactionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionModel &&
        amount == other.amount &&
        id == other.id &&
        category == other.category &&
        createdAt == other.createdAt &&
        income == other.income &&
        isUsd == other.isUsd &&
        note == other.note;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, income.hashCode);
    _$hash = $jc(_$hash, isUsd.hashCode);
    _$hash = $jc(_$hash, note.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TransactionModel')
          ..add('amount', amount)
          ..add('id', id)
          ..add('category', category)
          ..add('createdAt', createdAt)
          ..add('income', income)
          ..add('isUsd', isUsd)
          ..add('note', note))
        .toString();
  }
}

class TransactionModelBuilder
    implements Builder<TransactionModel, TransactionModelBuilder> {
  _$TransactionModel? _$v;

  String? _amount;
  String? get amount => _$this._amount;
  set amount(String? amount) => _$this._amount = amount;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  Timestamp? _createdAt;
  Timestamp? get createdAt => _$this._createdAt;
  set createdAt(Timestamp? createdAt) => _$this._createdAt = createdAt;

  bool? _income;
  bool? get income => _$this._income;
  set income(bool? income) => _$this._income = income;

  bool? _isUsd;
  bool? get isUsd => _$this._isUsd;
  set isUsd(bool? isUsd) => _$this._isUsd = isUsd;

  String? _note;
  String? get note => _$this._note;
  set note(String? note) => _$this._note = note;

  TransactionModelBuilder();

  TransactionModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _id = $v.id;
      _category = $v.category;
      _createdAt = $v.createdAt;
      _income = $v.income;
      _isUsd = $v.isUsd;
      _note = $v.note;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionModel other) {
    _$v = other as _$TransactionModel;
  }

  @override
  void update(void Function(TransactionModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransactionModel build() => _build();

  _$TransactionModel _build() {
    final _$result =
        _$v ??
        _$TransactionModel._(
          amount: BuiltValueNullFieldError.checkNotNull(
            amount,
            r'TransactionModel',
            'amount',
          ),
          id: BuiltValueNullFieldError.checkNotNull(
            id,
            r'TransactionModel',
            'id',
          ),
          category: BuiltValueNullFieldError.checkNotNull(
            category,
            r'TransactionModel',
            'category',
          ),
          createdAt: BuiltValueNullFieldError.checkNotNull(
            createdAt,
            r'TransactionModel',
            'createdAt',
          ),
          income: BuiltValueNullFieldError.checkNotNull(
            income,
            r'TransactionModel',
            'income',
          ),
          isUsd: BuiltValueNullFieldError.checkNotNull(
            isUsd,
            r'TransactionModel',
            'isUsd',
          ),
          note: BuiltValueNullFieldError.checkNotNull(
            note,
            r'TransactionModel',
            'note',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
