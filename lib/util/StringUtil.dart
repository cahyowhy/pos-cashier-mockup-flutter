import 'package:intl/intl.dart';

String formatCurrency(int value, {String symbol = "Rp "}) {
  final NumberFormat currency = new NumberFormat("$symbol#,##0.00", "en_US");

  return currency.format(value);
}

String generateQuery(Map query) {
  int index = 0;
  String url = "";

  query.forEach((key, value) {
    url += "${index == 0 ? '?' : '&'}${key.toString()}=${value.toString()}";
    index += 1;
  });

  return url;
}

bool emailValid(String email) {
  return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}

dynamic mapGet(Map map, List path) {
  assert(path.length > 0);
  var m = map ?? const {};
  for (int i = 0; i < path.length - 1; i++) {
    m = m[path[i]] ?? const {};
  }

  return m[path.last];
}

String localization(List path, {dynamic param, String locale = 'ID'}) {
  Map<String, Map<String, Map<String, String>>> locals = {
    'ID': {
      'NOTIFICATION': {
        "401": "Akses ditolak",
        "0000": "Layanan tidak tersedia",
        "0010": "Data berhasil disimpan",
        "0011": "Data sudah ada",
        "0012": "Update gagal",
        "0013": "Update berhasil",
        "0014": "Data berhasil dihapus",
        "0015": "Data gagal dihapus",
        "0016": "Data gagal dihapus",
        "0017": "Upload gagal",
        "0018": "Upload berhasil",
        "0600": "Kesalahan Sistem",
        "0601": "Koneksi gagal",
        "00602": "DB exception",
        "0607": "Belum memiliki akses",
        "0608": "Belum terverifikasi",
        "0609": "Masa uji coba berakhir",
        "0606": "Ilegal akses",
        "0021": "Data tidak ditemukan",
        "0022": "Data exceed limit",
        "1101": "Login Sukses",
        "1102": "Login Gagal",
        "1103": "Pengguna atau Kata sandi tidak terdaftar",
        "1104": "Pengguna sudah ada",
        "1105": "Sesi Pengguna telah kadaluarsa",
        "1106": "Kata sandi tidak benar",
        "1107": "Token tidak valid",
        "1111": "Masukan tidak benar",
        "1112": "Operasi selesai",
        "1113": "Operasi gagal",
        "1121": "Print sukses",
        "1122": "Print gagal",
        "1201": "Email sudah ada",
        "1202": "Email tidak ditemukan",
        "1203": "Nama pengguna sudah ada",
        "1333": "Pengguna atau Kata sandi tidak terdaftar dalam mode offline"
      }
    }
  };

  return mapGet(locals, ['ID', ...path]);
}
