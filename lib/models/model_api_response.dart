enum EnumApiResult { success, failed, unknown }

class ModelApiResult {
  final EnumApiResult status;
  final String? message;
  ModelApiResult({required this.status, this.message});
}
