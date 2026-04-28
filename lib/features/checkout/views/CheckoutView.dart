import 'package:flutter/material.dart';
import 'package:food/features/checkout/widgets/checkout_section_title.dart';
import 'package:food/features/checkout/widgets/payment_method_card.dart';
import 'package:food/features/checkout/widgets/summary_row.dart';
import 'package:gap/gap.dart';

enum _PaymentMethod { cashOnDelivery, debitCard }

class Checkoutview extends StatefulWidget {
  const Checkoutview({super.key});

  @override
  State<Checkoutview> createState() => _CheckoutviewState();
}

class _CheckoutviewState extends State<Checkoutview> {
  _PaymentMethod _selectedPaymentMethod = _PaymentMethod.cashOnDelivery;
  bool _saveCardDetails = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const Gap(22),
                  const Text(
                    "Order summary",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2A2527),
                    ),
                  ),
                  const Gap(24),
                  const SummaryRow(title: 'Order', value: '\$16.48'),
                  const Gap(14),
                  const SummaryRow(title: 'Taxes', value: '\$0.3'),
                  const Gap(14),
                  const SummaryRow(title: 'Delivery fees', value: '\$1.5'),
                  const Gap(12),

                  const Gap(12),
                  const SummaryRow(
                    title: 'Total:',
                    value: '\$18.19',
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2A2527),
                    ),
                  ),
                  const Gap(16),
                  const SummaryRow(
                    title: 'Estimated delivery time:',
                    value: '15 - 30 mins',
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF3C3739),
                    ),
                    valueStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF3C3739),
                    ),
                  ),
                  const Gap(56),
                  const Text(
                    "payment method",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2A2527),
                    ),
                  ),
                  const Gap(18),
                  PaymentMethodCard(
                    isSelected:
                        _selectedPaymentMethod == _PaymentMethod.cashOnDelivery,
                    onTap: () => setState(
                      () => _selectedPaymentMethod =
                          _PaymentMethod.cashOnDelivery,
                    ),
                    backgroundColor: const Color(0xFF3B2C30),
                    indicatorColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 16,
                    ),
                    title: 'Cash on Delivery',
                    titleStyle: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    leading: Container(
                      width: 46,
                      height: 46,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF306B00),
                      ),
                      child: const Center(
                        child: Text(
                          '\$',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x1A000000),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  const Gap(14),
                  PaymentMethodCard(
                    isSelected:
                        _selectedPaymentMethod == _PaymentMethod.debitCard,
                    onTap: () => setState(
                      () => _selectedPaymentMethod = _PaymentMethod.debitCard,
                    ),
                    backgroundColor: const Color(0xFFF4F4F6),
                    indicatorColor: const Color(0xFF9E9EA2),
                    title: 'Debit card',
                    subtitle: '3566 **** **** 0505',
                    titleStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2A2527),
                    ),
                    subtitleStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8F8E93),
                    ),
                    leading: const Text(
                      'VISA',
                      style: TextStyle(
                        color: Color(0xFF0A63B0),
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  const Gap(16),
                  InkWell(
                    onTap: () {
                      setState(() => _saveCardDetails = !_saveCardDetails);
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: _saveCardDetails
                                ? const Color(0xFFEC3A4C)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: _saveCardDetails
                                  ? const Color(0xFFEC3A4C)
                                  : const Color(0xFFC8C8CA),
                            ),
                          ),
                          child: _saveCardDetails
                              ? const Icon(
                                  Icons.check,
                                  size: 14,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                        const Gap(8),
                        const Text(
                          'Save card details for future payments',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7B7A7E),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(32),
                ],
              ),
            ),
            _buildBottomPaySection(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomPaySection() {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF2F2F2),
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 20),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total price',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8F8E93),
                  ),
                ),
                Gap(2),
                Text(
                  '\$18.19',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF013616),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 150,
            height: 58,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xFF025A22),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Pay Now',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
