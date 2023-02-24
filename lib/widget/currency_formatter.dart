import 'package:money_formatter/money_formatter.dart';

class CurrencyFormatter {
  static String toIdr(double amount) {
    MoneyFormatter fmf = MoneyFormatter(
      amount: amount,
      settings: MoneyFormatterSettings(
        symbol: 'Rp.',
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 2,
      ),
    );

    return fmf.output.symbolOnLeft;
  }
}
