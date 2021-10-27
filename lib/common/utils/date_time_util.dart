import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  /// Initialize untuk mendapatkan format tanggal lokal
  static Future initialize() async {
    await initializeDateFormatting(('en-EN'));
  }

  /// mengembalikan dateformat berdasarkan local date format
  /// isi [tanggal] dengan DateTime atau TimeStamp
  /// [format] default =  dd MMMM yyyy , hasil : 12 Juni 2002
  static String dateFormat(dynamic tanggal,
      {String format = 'dd MMMM yyyy', String locale = 'id'}) {
    String hasil = '';
    if (tanggal is DateTime) {
      hasil = DateFormat(format, locale).format(tanggal).toString();
    } else {}
    return hasil;
  }

  static String? newDateFormat(dynamic tanggal,
      {String format = 'dd MMMM yyyy', String locale = 'id'}) {
    String? hasil;
    if (tanggal is DateTime) {
      hasil = DateFormat(format, locale).format(tanggal).toString();
    } else {}
    return hasil;
  }

  // static String? dateLogFormat(dynamic tanggal, {String format = 'dd/MM/yyyy', String locale = 'id'}) {
  //   String? hasil;
  //   DateTime now = DateTime.now();
  //   if (tanggal is DateTime) {
  //     if (dateFormat(tanggal) == dateFormat(now)) {
  //       hasil = 'common.today'.tr();
  //     } else if (dateFormat(now.add(Duration(days: -1))) ==
  //         dateFormat(tanggal)) {
  //       hasil = 'common.yesterday'.tr();
  //     } else {
  //       hasil = dateFormat(tanggal, format: format, locale: locale);
  //     }
  //   } else if (tanggal is Timestamp) {
  //     DateTime date = Timestamp(tanggal.seconds, tanggal.nanoseconds).toDate();

  //     if (dateFormat(date) == dateFormat(now)) {
  //       hasil = 'common.today'.tr();
  //     } else if (dateFormat(now.add(Duration(days: -1))) == dateFormat(date)) {
  //       hasil = 'common.yesterday'.tr();
  //     } else {
  //       hasil = dateFormat(date, format: format, locale: locale);
  //     }
  //   } else {}
  //   return hasil;
  // }

  /// Mengembalikan Durasi perbandingan antara [tanggala] dan [tanggalb]
  /// Isi [tanggala] maupun [tanggalb] dengan DateTime ataupun TimeStamp
  static Duration differenceTime(dynamic tanggalAwal, dynamic tanggalAkhir) {
    DateTime awal, akhir;

    if (tanggalAwal is DateTime) {
      awal = tanggalAwal;
    } else {
      return const Duration(milliseconds: 0);
    }

    if (tanggalAkhir is DateTime) {
      akhir = tanggalAkhir;
    } else {
      return const Duration(milliseconds: 0);
    }

    Duration duration = akhir.difference(awal);
    return duration;
  }

  static DateTime stringToDateTime(
    String savedDateString, {
    String? format,
  }) {
    return DateFormat(format ?? "yyyy-MM-ddT00:00:00").parse(savedDateString);
  }
}
