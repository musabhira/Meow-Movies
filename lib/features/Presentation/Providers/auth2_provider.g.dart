// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth2_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authenticationHash() => r'504c5aa733e42de05cf883c78dceaadfe43944c5';

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

abstract class _$Authentication extends BuildlessNotifier<bool> {
  late final BuildContext context;

  bool build(
    BuildContext context,
  );
}

/// See also [Authentication].
@ProviderFor(Authentication)
const authenticationProvider = AuthenticationFamily();

/// See also [Authentication].
class AuthenticationFamily extends Family<bool> {
  /// See also [Authentication].
  const AuthenticationFamily();

  /// See also [Authentication].
  AuthenticationProvider call(
    BuildContext context,
  ) {
    return AuthenticationProvider(
      context,
    );
  }

  @override
  AuthenticationProvider getProviderOverride(
    covariant AuthenticationProvider provider,
  ) {
    return call(
      provider.context,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'authenticationProvider';
}

/// See also [Authentication].
class AuthenticationProvider
    extends NotifierProviderImpl<Authentication, bool> {
  /// See also [Authentication].
  AuthenticationProvider(
    BuildContext context,
  ) : this._internal(
          () => Authentication()..context = context,
          from: authenticationProvider,
          name: r'authenticationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$authenticationHash,
          dependencies: AuthenticationFamily._dependencies,
          allTransitiveDependencies:
              AuthenticationFamily._allTransitiveDependencies,
          context: context,
        );

  AuthenticationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  bool runNotifierBuild(
    covariant Authentication notifier,
  ) {
    return notifier.build(
      context,
    );
  }

  @override
  Override overrideWith(Authentication Function() create) {
    return ProviderOverride(
      origin: this,
      override: AuthenticationProvider._internal(
        () => create()..context = context,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  NotifierProviderElement<Authentication, bool> createElement() {
    return _AuthenticationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AuthenticationProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AuthenticationRef on NotifierProviderRef<bool> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _AuthenticationProviderElement
    extends NotifierProviderElement<Authentication, bool>
    with AuthenticationRef {
  _AuthenticationProviderElement(super.provider);

  @override
  BuildContext get context => (origin as AuthenticationProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
