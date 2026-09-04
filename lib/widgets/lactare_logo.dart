import 'package:flutter/material.dart';
import '../app_theme.dart';

class LactareLogo extends StatelessWidget {
  final double fontSize;
  final bool showSubtitle;
  final Color? cor;

  const LactareLogo({
    super.key,
    this.fontSize = 36,
    this.showSubtitle = true,
    this.cor,
  });

  @override
  Widget build(BuildContext context) {
    final corLogo = cor ?? AppTheme.azulEscuro;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: fontSize * 2,
          height: fontSize * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.azulClaro.withOpacity(0.15),
          ),
          child: Icon(
            Icons.volunteer_activism,
            size: fontSize,
            color: AppTheme.azulClaro,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Lactare',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: corLogo,
            fontStyle: FontStyle.italic,
          ),
        ),
        if (showSubtitle) ...[
          const SizedBox(height: 4),
          Text(
            'banco de leite',
            style: TextStyle(
              fontSize: fontSize * 0.38,
              color: AppTheme.azulClaro,
              letterSpacing: 2,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}
