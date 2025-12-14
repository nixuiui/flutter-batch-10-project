import 'package:flutter_batch_10_project/helpers/helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('formatRupiah', () {
    test('should format numbers correctly', () {
      expect(formatRupiah(1000), 'Rp 1.000');
      expect(formatRupiah(1000000), 'Rp 1.000.000');
    });

    test('should format negative numbers correctly', () {
      expect(formatRupiah(-1000), '(Rp 1.000)');
      expect(formatRupiah(-500000), '(Rp 500.000)');
    });

    test('should format null or zero values correctly', () {
      expect(formatRupiah(null), 'Rp 0');
      expect(formatRupiah(0), 'Rp 0');
    });
  });

}