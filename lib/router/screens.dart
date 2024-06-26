enum Screens {
  //unprotected routes
  splash('/splash', 'Splash'),
  onboarding('/onboarding', 'Onboarding'),

  //home
  home('/home', 'Home'),
  patientInfo('/patientInfo', 'PatientInfo'),
  patientInfo2('patientInfo2', 'PatientInfo2'),
  reminders('/reminders', 'Reminders'),
  socialNetwork('/socialNetwork', 'SocialNetwork'),
  chat('chat', 'Chat'),
  faq('faq', 'Faq'),
  aboutUs('aboutUs', 'AboutUs'),

  seizureRecords('/seizuerRecords', 'SeizuerRecords'),
  seizureRecordsVideo('seizuerRecordsVideo', 'SeizuerRecordsVideo'),
  dusme('dusme', 'Dusme'),
  sara2('sara2', 'Sara2'),
  cameraPage('cameraPage', 'CameraPage'),
  yeniPlayer2('yeniPlayer2', 'YeniPlayer2'),
  mesajPage('mesajPage', 'MesajPage'),

  patientDetail('patientDetail', 'PatientDetail'),
  ;

  const Screens(this.path, this.name);
  final String path;
  final String name;
}
