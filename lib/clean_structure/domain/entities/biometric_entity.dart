class BiometricEntity{
  final bool? isAuthenticated;
  final int? failedAttempts;


  const BiometricEntity({  this.failedAttempts,  this.isAuthenticated});


}