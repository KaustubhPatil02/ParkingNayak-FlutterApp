// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createOfficerHash() => r'9b3b8adf1a18a3010151e4688d9a404601122c12';

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

/// See also [createOfficer].
@ProviderFor(createOfficer)
const createOfficerProvider = CreateOfficerFamily();

/// See also [createOfficer].
class CreateOfficerFamily extends Family<AsyncValue<void>> {
  /// See also [createOfficer].
  const CreateOfficerFamily();

  /// See also [createOfficer].
  CreateOfficerProvider call({
    String id = "",
    required String batchId,
    required String userId,
    required String officerName,
    required String phoneNo,
    required String location,
  }) {
    return CreateOfficerProvider(
      id: id,
      batchId: batchId,
      userId: userId,
      officerName: officerName,
      phoneNo: phoneNo,
      location: location,
    );
  }

  @override
  CreateOfficerProvider getProviderOverride(
    covariant CreateOfficerProvider provider,
  ) {
    return call(
      id: provider.id,
      batchId: provider.batchId,
      userId: provider.userId,
      officerName: provider.officerName,
      phoneNo: provider.phoneNo,
      location: provider.location,
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
  String? get name => r'createOfficerProvider';
}

/// See also [createOfficer].
class CreateOfficerProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createOfficer].
  CreateOfficerProvider({
    String id = "",
    required String batchId,
    required String userId,
    required String officerName,
    required String phoneNo,
    required String location,
  }) : this._internal(
          (ref) => createOfficer(
            ref as CreateOfficerRef,
            id: id,
            batchId: batchId,
            userId: userId,
            officerName: officerName,
            phoneNo: phoneNo,
            location: location,
          ),
          from: createOfficerProvider,
          name: r'createOfficerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createOfficerHash,
          dependencies: CreateOfficerFamily._dependencies,
          allTransitiveDependencies:
              CreateOfficerFamily._allTransitiveDependencies,
          id: id,
          batchId: batchId,
          userId: userId,
          officerName: officerName,
          phoneNo: phoneNo,
          location: location,
        );

  CreateOfficerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.batchId,
    required this.userId,
    required this.officerName,
    required this.phoneNo,
    required this.location,
  }) : super.internal();

  final String id;
  final String batchId;
  final String userId;
  final String officerName;
  final String phoneNo;
  final String location;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateOfficerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateOfficerProvider._internal(
        (ref) => create(ref as CreateOfficerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        batchId: batchId,
        userId: userId,
        officerName: officerName,
        phoneNo: phoneNo,
        location: location,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateOfficerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateOfficerProvider &&
        other.id == id &&
        other.batchId == batchId &&
        other.userId == userId &&
        other.officerName == officerName &&
        other.phoneNo == phoneNo &&
        other.location == location;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, batchId.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, officerName.hashCode);
    hash = _SystemHash.combine(hash, phoneNo.hashCode);
    hash = _SystemHash.combine(hash, location.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateOfficerRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `batchId` of this provider.
  String get batchId;

  /// The parameter `userId` of this provider.
  String get userId;

  /// The parameter `officerName` of this provider.
  String get officerName;

  /// The parameter `phoneNo` of this provider.
  String get phoneNo;

  /// The parameter `location` of this provider.
  String get location;
}

class _CreateOfficerProviderElement
    extends AutoDisposeFutureProviderElement<void> with CreateOfficerRef {
  _CreateOfficerProviderElement(super.provider);

  @override
  String get id => (origin as CreateOfficerProvider).id;
  @override
  String get batchId => (origin as CreateOfficerProvider).batchId;
  @override
  String get userId => (origin as CreateOfficerProvider).userId;
  @override
  String get officerName => (origin as CreateOfficerProvider).officerName;
  @override
  String get phoneNo => (origin as CreateOfficerProvider).phoneNo;
  @override
  String get location => (origin as CreateOfficerProvider).location;
}

String _$createParkingTicketHash() =>
    r'77ad0c3d793074ae8082759a91a50579a30e0a23';

/// See also [createParkingTicket].
@ProviderFor(createParkingTicket)
const createParkingTicketProvider = CreateParkingTicketFamily();

/// See also [createParkingTicket].
class CreateParkingTicketFamily extends Family<AsyncValue<void>> {
  /// See also [createParkingTicket].
  const CreateParkingTicketFamily();

  /// See also [createParkingTicket].
  CreateParkingTicketProvider call({
    String id = "",
    required String numberPlate,
    required String officerId,
    required String phoneNo,
    required DateTime dateTime,
    required String dropLocation,
    required int fine,
  }) {
    return CreateParkingTicketProvider(
      id: id,
      numberPlate: numberPlate,
      officerId: officerId,
      phoneNo: phoneNo,
      dateTime: dateTime,
      dropLocation: dropLocation,
      fine: fine,
    );
  }

  @override
  CreateParkingTicketProvider getProviderOverride(
    covariant CreateParkingTicketProvider provider,
  ) {
    return call(
      id: provider.id,
      numberPlate: provider.numberPlate,
      officerId: provider.officerId,
      phoneNo: provider.phoneNo,
      dateTime: provider.dateTime,
      dropLocation: provider.dropLocation,
      fine: provider.fine,
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
  String? get name => r'createParkingTicketProvider';
}

/// See also [createParkingTicket].
class CreateParkingTicketProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createParkingTicket].
  CreateParkingTicketProvider({
    String id = "",
    required String numberPlate,
    required String officerId,
    required String phoneNo,
    required DateTime dateTime,
    required String dropLocation,
    required int fine,
  }) : this._internal(
          (ref) => createParkingTicket(
            ref as CreateParkingTicketRef,
            id: id,
            numberPlate: numberPlate,
            officerId: officerId,
            phoneNo: phoneNo,
            dateTime: dateTime,
            dropLocation: dropLocation,
            fine: fine,
          ),
          from: createParkingTicketProvider,
          name: r'createParkingTicketProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createParkingTicketHash,
          dependencies: CreateParkingTicketFamily._dependencies,
          allTransitiveDependencies:
              CreateParkingTicketFamily._allTransitiveDependencies,
          id: id,
          numberPlate: numberPlate,
          officerId: officerId,
          phoneNo: phoneNo,
          dateTime: dateTime,
          dropLocation: dropLocation,
          fine: fine,
        );

  CreateParkingTicketProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.numberPlate,
    required this.officerId,
    required this.phoneNo,
    required this.dateTime,
    required this.dropLocation,
    required this.fine,
  }) : super.internal();

  final String id;
  final String numberPlate;
  final String officerId;
  final String phoneNo;
  final DateTime dateTime;
  final String dropLocation;
  final int fine;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateParkingTicketRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateParkingTicketProvider._internal(
        (ref) => create(ref as CreateParkingTicketRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        numberPlate: numberPlate,
        officerId: officerId,
        phoneNo: phoneNo,
        dateTime: dateTime,
        dropLocation: dropLocation,
        fine: fine,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateParkingTicketProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateParkingTicketProvider &&
        other.id == id &&
        other.numberPlate == numberPlate &&
        other.officerId == officerId &&
        other.phoneNo == phoneNo &&
        other.dateTime == dateTime &&
        other.dropLocation == dropLocation &&
        other.fine == fine;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, numberPlate.hashCode);
    hash = _SystemHash.combine(hash, officerId.hashCode);
    hash = _SystemHash.combine(hash, phoneNo.hashCode);
    hash = _SystemHash.combine(hash, dateTime.hashCode);
    hash = _SystemHash.combine(hash, dropLocation.hashCode);
    hash = _SystemHash.combine(hash, fine.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateParkingTicketRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `numberPlate` of this provider.
  String get numberPlate;

  /// The parameter `officerId` of this provider.
  String get officerId;

  /// The parameter `phoneNo` of this provider.
  String get phoneNo;

  /// The parameter `dateTime` of this provider.
  DateTime get dateTime;

  /// The parameter `dropLocation` of this provider.
  String get dropLocation;

  /// The parameter `fine` of this provider.
  int get fine;
}

class _CreateParkingTicketProviderElement
    extends AutoDisposeFutureProviderElement<void> with CreateParkingTicketRef {
  _CreateParkingTicketProviderElement(super.provider);

  @override
  String get id => (origin as CreateParkingTicketProvider).id;
  @override
  String get numberPlate => (origin as CreateParkingTicketProvider).numberPlate;
  @override
  String get officerId => (origin as CreateParkingTicketProvider).officerId;
  @override
  String get phoneNo => (origin as CreateParkingTicketProvider).phoneNo;
  @override
  DateTime get dateTime => (origin as CreateParkingTicketProvider).dateTime;
  @override
  String get dropLocation =>
      (origin as CreateParkingTicketProvider).dropLocation;
  @override
  int get fine => (origin as CreateParkingTicketProvider).fine;
}

String _$updateOfficerHash() => r'a09d608620bcddbeaec3f00006bd3a5c6bebf1d6';

/// See also [updateOfficer].
@ProviderFor(updateOfficer)
const updateOfficerProvider = UpdateOfficerFamily();

/// See also [updateOfficer].
class UpdateOfficerFamily extends Family<AsyncValue<void>> {
  /// See also [updateOfficer].
  const UpdateOfficerFamily();

  /// See also [updateOfficer].
  UpdateOfficerProvider call({
    String id = "",
    required String batchId,
    required String userId,
    required String officerName,
    required String phoneNo,
    required String location,
  }) {
    return UpdateOfficerProvider(
      id: id,
      batchId: batchId,
      userId: userId,
      officerName: officerName,
      phoneNo: phoneNo,
      location: location,
    );
  }

  @override
  UpdateOfficerProvider getProviderOverride(
    covariant UpdateOfficerProvider provider,
  ) {
    return call(
      id: provider.id,
      batchId: provider.batchId,
      userId: provider.userId,
      officerName: provider.officerName,
      phoneNo: provider.phoneNo,
      location: provider.location,
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
  String? get name => r'updateOfficerProvider';
}

/// See also [updateOfficer].
class UpdateOfficerProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateOfficer].
  UpdateOfficerProvider({
    String id = "",
    required String batchId,
    required String userId,
    required String officerName,
    required String phoneNo,
    required String location,
  }) : this._internal(
          (ref) => updateOfficer(
            ref as UpdateOfficerRef,
            id: id,
            batchId: batchId,
            userId: userId,
            officerName: officerName,
            phoneNo: phoneNo,
            location: location,
          ),
          from: updateOfficerProvider,
          name: r'updateOfficerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateOfficerHash,
          dependencies: UpdateOfficerFamily._dependencies,
          allTransitiveDependencies:
              UpdateOfficerFamily._allTransitiveDependencies,
          id: id,
          batchId: batchId,
          userId: userId,
          officerName: officerName,
          phoneNo: phoneNo,
          location: location,
        );

  UpdateOfficerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.batchId,
    required this.userId,
    required this.officerName,
    required this.phoneNo,
    required this.location,
  }) : super.internal();

  final String id;
  final String batchId;
  final String userId;
  final String officerName;
  final String phoneNo;
  final String location;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateOfficerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateOfficerProvider._internal(
        (ref) => create(ref as UpdateOfficerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        batchId: batchId,
        userId: userId,
        officerName: officerName,
        phoneNo: phoneNo,
        location: location,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateOfficerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateOfficerProvider &&
        other.id == id &&
        other.batchId == batchId &&
        other.userId == userId &&
        other.officerName == officerName &&
        other.phoneNo == phoneNo &&
        other.location == location;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, batchId.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, officerName.hashCode);
    hash = _SystemHash.combine(hash, phoneNo.hashCode);
    hash = _SystemHash.combine(hash, location.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateOfficerRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `batchId` of this provider.
  String get batchId;

  /// The parameter `userId` of this provider.
  String get userId;

  /// The parameter `officerName` of this provider.
  String get officerName;

  /// The parameter `phoneNo` of this provider.
  String get phoneNo;

  /// The parameter `location` of this provider.
  String get location;
}

class _UpdateOfficerProviderElement
    extends AutoDisposeFutureProviderElement<void> with UpdateOfficerRef {
  _UpdateOfficerProviderElement(super.provider);

  @override
  String get id => (origin as UpdateOfficerProvider).id;
  @override
  String get batchId => (origin as UpdateOfficerProvider).batchId;
  @override
  String get userId => (origin as UpdateOfficerProvider).userId;
  @override
  String get officerName => (origin as UpdateOfficerProvider).officerName;
  @override
  String get phoneNo => (origin as UpdateOfficerProvider).phoneNo;
  @override
  String get location => (origin as UpdateOfficerProvider).location;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
