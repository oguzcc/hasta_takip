enum Screens {
  //unprotected routes
  splash('/splash', 'Splash'),
  onboarding('/onboarding', 'Onboarding'),

  //home
  home('/home', 'Home'),
  patientInfo('/patientInfo', 'PatientInfo'),
  seizureRecords('/seizuerRecords', 'SeizuerRecords'),
  reminders('/reminders', 'Reminders'),
  socialNetwork('/socialNetwork', 'SocialNetwork'),
  ;

  const Screens(this.path, this.name);
  final String path;
  final String name;
}
