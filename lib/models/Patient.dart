class Patient {
  final String patientTag;
  final Map data;

  const Patient({
    this.patientTag,
    this.data
  });
}

class PatientData {
  final int age;
  final String name;
  final bool smoker;

  const PatientData({
    this.name,
    this.age,
    this.smoker
});
}