import 'package:arkit_plugin/geometries/arkit_material.dart';
import 'package:arkit_plugin/geometries/arkit_vector3.dart';
import 'package:arkit_plugin/geometries/arkit_vector4.dart';
import 'package:flutter/widgets.dart';

/// ARKitGeometry is an abstract class that represents the geometry that can be attached to a SCNNode.
abstract class ARKitGeometry {
  ARKitGeometry(
    ARKitVector3 position, {
    this.materials,
    ARKitVector3 scale,
    ARKitVector4 rotation,
    this.name,
  })  : position = ValueNotifier(position),
        scale = ValueNotifier(scale),
        rotation = ValueNotifier(rotation);

  /// Specifies the receiver's materials array.
  /// Each geometry element can be rendered using a different material.
  /// The index of the material used for a geometry element is equal to the index of that element modulo the number of materials.
  final List<ARKitMaterial> materials;

  /// Determines the receiver's position.
  final ValueNotifier<ARKitVector3> position;

  /// Determines the receiver's scale.
  final ValueNotifier<ARKitVector3> scale;

  /// Determines the receiver's rotation.
  /// The rotation is axis angle rotation.
  /// The three first components are the axis, the fourth one is the rotation (in radian).
  final ValueNotifier<ARKitVector4> rotation;

  /// Determines the name of the receiver.
  final String name;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'position': position.value.toMap(),
        'scale': scale?.value?.toMap(),
        'rotation': rotation?.value?.toMap(),
        'name': name,
        'materials':
            materials != null ? materials.map((m) => m.toMap()).toList() : null,
      }..removeWhere((String k, dynamic v) => v == null);
}
