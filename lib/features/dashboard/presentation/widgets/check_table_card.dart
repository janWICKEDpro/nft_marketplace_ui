import 'package:flutter/material.dart';
import 'package:nft_marketplace/core/theme/app_colors.dart';
import 'package:nft_marketplace/core/utils/responsive.dart';

class CheckTableCard extends StatefulWidget {
  const CheckTableCard({super.key});

  @override
  State<CheckTableCard> createState() => _CheckTableCardState();
}

class CheckTableRowData {
  final String name;
  final String progress;
  final String quantity;
  final String date;
  bool isChecked;

  CheckTableRowData({
    required this.name,
    required this.progress,
    required this.quantity,
    required this.date,
    this.isChecked = false,
  });
}

class _CheckTableCardState extends State<CheckTableCard> {
  // State for the table rows
  final List<CheckTableRowData> _tableData = [
    CheckTableRowData(
      name: 'Horizon UI PRO',
      progress: '17.5%',
      quantity: '2.458',
      date: '24.Jan.2021',
      isChecked: false,
    ),
    CheckTableRowData(
      name: 'Horizon UI Free',
      progress: '10.8%',
      quantity: '1.485',
      date: '12.Jun.2021',
      isChecked: true,
    ),
    CheckTableRowData(
      name: 'Weekly Update',
      progress: '21.3%',
      quantity: '1.024',
      date: '5.Jan.2021',
      isChecked: true,
    ),
    CheckTableRowData(
      name: 'Venus 3D Asset',
      progress: '31.5%',
      quantity: '858',
      date: '7.Mar.2021',
      isChecked: true,
    ),
    CheckTableRowData(
      name: 'Marketplace',
      progress: '12.2%',
      quantity: '258',
      date: '17.Dec.2021',
      isChecked: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: isDark ? null : Border.all(color: AppColors.border, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Card Header ---
          Row(
            children: [
              Text(
                "Check Table",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Icon(Icons.more_horiz, color: Theme.of(context).iconTheme.color),
            ],
          ),
          const SizedBox(height: 20),

          // --- Table Header ---
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 700, // Adjust width as needed for your table
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTableHeader(context),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  AspectRatio(
                    aspectRatio: context.responsive(
                      mobile: 2.0,
                      tablet: 1.8,
                      desktop: 4.5,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children:
                            _tableData.asMap().entries.map((entry) {
                              final index = entry.key;
                              final data = entry.value;
                              return _CheckTableRow(
                                data: data,
                                onChanged: (newValue) {
                                  setState(() {
                                    _tableData[index].isChecked = newValue!;
                                  });
                                },
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader(BuildContext context) {
    final headerStyle = Theme.of(
      context,
    ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 14);

    return Row(
      children: [
        Expanded(flex: 3, child: Text('NAME', style: headerStyle)),
        Expanded(flex: 2, child: Text('PROGRESS', style: headerStyle)),
        Expanded(flex: 2, child: Text('QUANTITY', style: headerStyle)),
        Expanded(flex: 2, child: Text('DATE', style: headerStyle)),
      ],
    );
  }
}

// ------------------- NEW: INTERACTIVE TABLE ROW WIDGET -------------------
class _CheckTableRow extends StatefulWidget {
  final CheckTableRowData data;
  final ValueChanged<bool?> onChanged;

  const _CheckTableRow({required this.data, required this.onChanged});

  @override
  State<_CheckTableRow> createState() => _CheckTableRowState();
}

class _CheckTableRowState extends State<_CheckTableRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final rowColor =
        _isHovered
            ? (isDark
                ? Colors.white.withOpacity(0.05)
                : AppColors.primary.withOpacity(0.05))
            : Colors.transparent;

    final cellStyle = Theme.of(
      context,
    ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 14);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => widget.onChanged(!widget.data.isChecked),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: rowColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    _CustomCheckbox(
                      value: widget.data.isChecked,
                      onChanged: widget.onChanged,
                    ),
                    const SizedBox(width: 12),
                    Text(widget.data.name, style: cellStyle),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(widget.data.progress, style: cellStyle),
              ),
              Expanded(
                flex: 2,
                child: Text(widget.data.quantity, style: cellStyle),
              ),
              Expanded(
                flex: 2,
                child: Text(widget.data.date, style: cellStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------- NEW: CUSTOM CHECKBOX WIDGET -------------------
class _CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _CustomCheckbox({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: value ? colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color:
                value
                    ? colorScheme.primary
                    : (isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.textSecondary),
            width: 2,
          ),
        ),
        child:
            value
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : null,
      ),
    );
  }
}
