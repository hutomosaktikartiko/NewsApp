/// The type value is [Generic Type]
/// 
/// isSuccess default is [false]
class ApiReturnValue<T> {
  bool isSuccess;
  T? value;
  String? message;

  ApiReturnValue({
    this.value,
    this.isSuccess = false,
    this.message,
  });
}
