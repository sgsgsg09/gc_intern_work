// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Hospital _$HospitalFromJson(Map<String, dynamic> json) {
  return _Hospital.fromJson(json);
}

/// @nodoc
mixin _$Hospital {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;

  /// 병원 소속 사원들의 리스트
  List<Employee> get employees => throw _privateConstructorUsedError;

  /// Serializes this Hospital to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HospitalCopyWith<Hospital> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalCopyWith<$Res> {
  factory $HospitalCopyWith(Hospital value, $Res Function(Hospital) then) =
      _$HospitalCopyWithImpl<$Res, Hospital>;
  @useResult
  $Res call({
    String id,
    String name,
    String location,
    List<Employee> employees,
  });
}

/// @nodoc
class _$HospitalCopyWithImpl<$Res, $Val extends Hospital>
    implements $HospitalCopyWith<$Res> {
  _$HospitalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? employees = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            location:
                null == location
                    ? _value.location
                    : location // ignore: cast_nullable_to_non_nullable
                        as String,
            employees:
                null == employees
                    ? _value.employees
                    : employees // ignore: cast_nullable_to_non_nullable
                        as List<Employee>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HospitalImplCopyWith<$Res>
    implements $HospitalCopyWith<$Res> {
  factory _$$HospitalImplCopyWith(
    _$HospitalImpl value,
    $Res Function(_$HospitalImpl) then,
  ) = __$$HospitalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String location,
    List<Employee> employees,
  });
}

/// @nodoc
class __$$HospitalImplCopyWithImpl<$Res>
    extends _$HospitalCopyWithImpl<$Res, _$HospitalImpl>
    implements _$$HospitalImplCopyWith<$Res> {
  __$$HospitalImplCopyWithImpl(
    _$HospitalImpl _value,
    $Res Function(_$HospitalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? employees = null,
  }) {
    return _then(
      _$HospitalImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        location:
            null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                    as String,
        employees:
            null == employees
                ? _value._employees
                : employees // ignore: cast_nullable_to_non_nullable
                    as List<Employee>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HospitalImpl implements _Hospital {
  const _$HospitalImpl({
    required this.id,
    required this.name,
    required this.location,
    required final List<Employee> employees,
  }) : _employees = employees;

  factory _$HospitalImpl.fromJson(Map<String, dynamic> json) =>
      _$$HospitalImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String location;

  /// 병원 소속 사원들의 리스트
  final List<Employee> _employees;

  /// 병원 소속 사원들의 리스트
  @override
  List<Employee> get employees {
    if (_employees is EqualUnmodifiableListView) return _employees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_employees);
  }

  @override
  String toString() {
    return 'Hospital(id: $id, name: $name, location: $location, employees: $employees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HospitalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(
              other._employees,
              _employees,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    location,
    const DeepCollectionEquality().hash(_employees),
  );

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HospitalImplCopyWith<_$HospitalImpl> get copyWith =>
      __$$HospitalImplCopyWithImpl<_$HospitalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HospitalImplToJson(this);
  }
}

abstract class _Hospital implements Hospital {
  const factory _Hospital({
    required final String id,
    required final String name,
    required final String location,
    required final List<Employee> employees,
  }) = _$HospitalImpl;

  factory _Hospital.fromJson(Map<String, dynamic> json) =
      _$HospitalImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get location;

  /// 병원 소속 사원들의 리스트
  @override
  List<Employee> get employees;

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HospitalImplCopyWith<_$HospitalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  return _Employee.fromJson(json);
}

/// @nodoc
mixin _$Employee {
  String get id => throw _privateConstructorUsedError;
  String get jobTitle => throw _privateConstructorUsedError;
  String get workplace =>
      throw _privateConstructorUsedError; // 사원이 작성한 메모(댓글)의 리스트
  List<Comment> get memos => throw _privateConstructorUsedError;

  /// Serializes this Employee to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Employee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmployeeCopyWith<Employee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeCopyWith<$Res> {
  factory $EmployeeCopyWith(Employee value, $Res Function(Employee) then) =
      _$EmployeeCopyWithImpl<$Res, Employee>;
  @useResult
  $Res call({
    String id,
    String jobTitle,
    String workplace,
    List<Comment> memos,
  });
}

/// @nodoc
class _$EmployeeCopyWithImpl<$Res, $Val extends Employee>
    implements $EmployeeCopyWith<$Res> {
  _$EmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Employee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? jobTitle = null,
    Object? workplace = null,
    Object? memos = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            jobTitle:
                null == jobTitle
                    ? _value.jobTitle
                    : jobTitle // ignore: cast_nullable_to_non_nullable
                        as String,
            workplace:
                null == workplace
                    ? _value.workplace
                    : workplace // ignore: cast_nullable_to_non_nullable
                        as String,
            memos:
                null == memos
                    ? _value.memos
                    : memos // ignore: cast_nullable_to_non_nullable
                        as List<Comment>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmployeeImplCopyWith<$Res>
    implements $EmployeeCopyWith<$Res> {
  factory _$$EmployeeImplCopyWith(
    _$EmployeeImpl value,
    $Res Function(_$EmployeeImpl) then,
  ) = __$$EmployeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String jobTitle,
    String workplace,
    List<Comment> memos,
  });
}

/// @nodoc
class __$$EmployeeImplCopyWithImpl<$Res>
    extends _$EmployeeCopyWithImpl<$Res, _$EmployeeImpl>
    implements _$$EmployeeImplCopyWith<$Res> {
  __$$EmployeeImplCopyWithImpl(
    _$EmployeeImpl _value,
    $Res Function(_$EmployeeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Employee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? jobTitle = null,
    Object? workplace = null,
    Object? memos = null,
  }) {
    return _then(
      _$EmployeeImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        jobTitle:
            null == jobTitle
                ? _value.jobTitle
                : jobTitle // ignore: cast_nullable_to_non_nullable
                    as String,
        workplace:
            null == workplace
                ? _value.workplace
                : workplace // ignore: cast_nullable_to_non_nullable
                    as String,
        memos:
            null == memos
                ? _value._memos
                : memos // ignore: cast_nullable_to_non_nullable
                    as List<Comment>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeeImpl implements _Employee {
  const _$EmployeeImpl({
    required this.id,
    required this.jobTitle,
    required this.workplace,
    required final List<Comment> memos,
  }) : _memos = memos;

  factory _$EmployeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeImplFromJson(json);

  @override
  final String id;
  @override
  final String jobTitle;
  @override
  final String workplace;
  // 사원이 작성한 메모(댓글)의 리스트
  final List<Comment> _memos;
  // 사원이 작성한 메모(댓글)의 리스트
  @override
  List<Comment> get memos {
    if (_memos is EqualUnmodifiableListView) return _memos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memos);
  }

  @override
  String toString() {
    return 'Employee(id: $id, jobTitle: $jobTitle, workplace: $workplace, memos: $memos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.workplace, workplace) ||
                other.workplace == workplace) &&
            const DeepCollectionEquality().equals(other._memos, _memos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    jobTitle,
    workplace,
    const DeepCollectionEquality().hash(_memos),
  );

  /// Create a copy of Employee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeImplCopyWith<_$EmployeeImpl> get copyWith =>
      __$$EmployeeImplCopyWithImpl<_$EmployeeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeImplToJson(this);
  }
}

abstract class _Employee implements Employee {
  const factory _Employee({
    required final String id,
    required final String jobTitle,
    required final String workplace,
    required final List<Comment> memos,
  }) = _$EmployeeImpl;

  factory _Employee.fromJson(Map<String, dynamic> json) =
      _$EmployeeImpl.fromJson;

  @override
  String get id;
  @override
  String get jobTitle;
  @override
  String get workplace; // 사원이 작성한 메모(댓글)의 리스트
  @override
  List<Comment> get memos;

  /// Create a copy of Employee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmployeeImplCopyWith<_$EmployeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get editDate =>
      throw _privateConstructorUsedError; // 메모에 달린 답글(댓글). (없을 경우 빈 리스트 반환)
  List<Comment> get replies => throw _privateConstructorUsedError;

  /// Serializes this Comment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call({
    String id,
    String content,
    DateTime editDate,
    List<Comment> replies,
  });
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? editDate = null,
    Object? replies = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            content:
                null == content
                    ? _value.content
                    : content // ignore: cast_nullable_to_non_nullable
                        as String,
            editDate:
                null == editDate
                    ? _value.editDate
                    : editDate // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            replies:
                null == replies
                    ? _value.replies
                    : replies // ignore: cast_nullable_to_non_nullable
                        as List<Comment>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CommentImplCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$CommentImplCopyWith(
    _$CommentImpl value,
    $Res Function(_$CommentImpl) then,
  ) = __$$CommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String content,
    DateTime editDate,
    List<Comment> replies,
  });
}

/// @nodoc
class __$$CommentImplCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$CommentImpl>
    implements _$$CommentImplCopyWith<$Res> {
  __$$CommentImplCopyWithImpl(
    _$CommentImpl _value,
    $Res Function(_$CommentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? editDate = null,
    Object? replies = null,
  }) {
    return _then(
      _$CommentImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        content:
            null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                    as String,
        editDate:
            null == editDate
                ? _value.editDate
                : editDate // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        replies:
            null == replies
                ? _value._replies
                : replies // ignore: cast_nullable_to_non_nullable
                    as List<Comment>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentImpl implements _Comment {
  const _$CommentImpl({
    required this.id,
    required this.content,
    required this.editDate,
    final List<Comment> replies = const [],
  }) : _replies = replies;

  factory _$CommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final DateTime editDate;
  // 메모에 달린 답글(댓글). (없을 경우 빈 리스트 반환)
  final List<Comment> _replies;
  // 메모에 달린 답글(댓글). (없을 경우 빈 리스트 반환)
  @override
  @JsonKey()
  List<Comment> get replies {
    if (_replies is EqualUnmodifiableListView) return _replies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_replies);
  }

  @override
  String toString() {
    return 'Comment(id: $id, content: $content, editDate: $editDate, replies: $replies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.editDate, editDate) ||
                other.editDate == editDate) &&
            const DeepCollectionEquality().equals(other._replies, _replies));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    content,
    editDate,
    const DeepCollectionEquality().hash(_replies),
  );

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      __$$CommentImplCopyWithImpl<_$CommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentImplToJson(this);
  }
}

abstract class _Comment implements Comment {
  const factory _Comment({
    required final String id,
    required final String content,
    required final DateTime editDate,
    final List<Comment> replies,
  }) = _$CommentImpl;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$CommentImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  DateTime get editDate; // 메모에 달린 답글(댓글). (없을 경우 빈 리스트 반환)
  @override
  List<Comment> get replies;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
