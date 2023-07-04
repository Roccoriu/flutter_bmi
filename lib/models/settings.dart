class Settings {
  String unitSystem;
  String name;

  Settings({
    required this.unitSystem,
    required this.name,
  });

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      unitSystem: map['unit_system'],
      name: map['name'],
    );
  }
}
