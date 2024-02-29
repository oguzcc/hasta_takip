enum Screens {
  //unprotected routes
  splash('/splash', 'Splash'),
  onboarding('/onboarding', 'Onboarding'),

  //home
  home('/home', 'Home'),
  patientInfo('/patientInfo', 'PatientInfo'),
  reminders('/reminders', 'Reminders'),
  socialNetwork('/socialNetwork', 'SocialNetwork'),
  chat('chat', 'Chat'),

  seizureRecords('/seizuerRecords', 'SeizuerRecords'),
  seizureRecordsVideo('seizuerRecordsVideo', 'SeizuerRecordsVideo'),
  dusme('dusme', 'Dusme'),
  sara2('sara2', 'Sara2'),
  cameraPage('cameraPage', 'CameraPage'),
  yeniPlayer2('yeniPlayer2', 'YeniPlayer2'),
  ;

  const Screens(this.path, this.name);
  final String path;
  final String name;
}
