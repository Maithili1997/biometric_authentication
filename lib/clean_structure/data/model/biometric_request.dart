class BiometricRequest {
  final bool biometricOnly;
  final int maxAttempts;
  final bool allowFallback;

  const BiometricRequest({
    this.biometricOnly = false,
    this.maxAttempts = 3,
    this.allowFallback = true,
  });
}