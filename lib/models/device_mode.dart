class Devicemo {
  int? versionBackend;

  Devicemo({
    this.versionBackend,
  });

  Devicemo.fromJson(Map<String, dynamic> json) {
    versionBackend = json["version_backend"];
  }

  Map<String, dynamic> toJson() {
    return {
      'versionBackend': versionBackend,
    };
  }
}
