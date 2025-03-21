// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hospitalViewModelHash() => r'21e7db2aec03c38ed484d18ab701f23de8051f14';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$HospitalViewModel
    extends BuildlessAutoDisposeAsyncNotifier<Hospital> {
  late final String hospitalId;

  FutureOr<Hospital> build(String hospitalId);
}

/// See also [HospitalViewModel].
@ProviderFor(HospitalViewModel)
const hospitalViewModelProvider = HospitalViewModelFamily();

/// See also [HospitalViewModel].
class HospitalViewModelFamily extends Family<AsyncValue<Hospital>> {
  /// See also [HospitalViewModel].
  const HospitalViewModelFamily();

  /// See also [HospitalViewModel].
  HospitalViewModelProvider call(String hospitalId) {
    return HospitalViewModelProvider(hospitalId);
  }

  @override
  HospitalViewModelProvider getProviderOverride(
    covariant HospitalViewModelProvider provider,
  ) {
    return call(provider.hospitalId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'hospitalViewModelProvider';
}

/// See also [HospitalViewModel].
class HospitalViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<HospitalViewModel, Hospital> {
  /// See also [HospitalViewModel].
  HospitalViewModelProvider(String hospitalId)
    : this._internal(
        () => HospitalViewModel()..hospitalId = hospitalId,
        from: hospitalViewModelProvider,
        name: r'hospitalViewModelProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$hospitalViewModelHash,
        dependencies: HospitalViewModelFamily._dependencies,
        allTransitiveDependencies:
            HospitalViewModelFamily._allTransitiveDependencies,
        hospitalId: hospitalId,
      );

  HospitalViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.hospitalId,
  }) : super.internal();

  final String hospitalId;

  @override
  FutureOr<Hospital> runNotifierBuild(covariant HospitalViewModel notifier) {
    return notifier.build(hospitalId);
  }

  @override
  Override overrideWith(HospitalViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: HospitalViewModelProvider._internal(
        () => create()..hospitalId = hospitalId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        hospitalId: hospitalId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<HospitalViewModel, Hospital>
  createElement() {
    return _HospitalViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HospitalViewModelProvider && other.hospitalId == hospitalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hospitalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HospitalViewModelRef on AutoDisposeAsyncNotifierProviderRef<Hospital> {
  /// The parameter `hospitalId` of this provider.
  String get hospitalId;
}

class _HospitalViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<HospitalViewModel, Hospital>
    with HospitalViewModelRef {
  _HospitalViewModelProviderElement(super.provider);

  @override
  String get hospitalId => (origin as HospitalViewModelProvider).hospitalId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
