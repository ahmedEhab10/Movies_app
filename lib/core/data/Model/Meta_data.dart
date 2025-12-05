class Meta {
  final int? serverTime;
  final String? serverTimezone;
  final int? apiVersion;
  final String? executionTime;

  Meta({
    this.serverTime,
    this.serverTimezone,
    this.apiVersion,
    this.executionTime,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      serverTime: json['server_time'],
      serverTimezone: json['server_timezone'],
      apiVersion: json['api_version'],
      executionTime: json['execution_time'],
    );
  }
}
