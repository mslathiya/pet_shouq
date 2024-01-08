import 'package:flutter/material.dart';
import 'package:pet_shouq/theme/theme.dart';

class StyledSwitch extends StatefulWidget {
  final void Function(bool isToggled) onToggled;
  final bool isActive;
  const StyledSwitch(
      {super.key, required this.onToggled, required this.isActive});

  @override
  State<StyledSwitch> createState() => _StyledSwitchState();
}

class _StyledSwitchState extends State<StyledSwitch> {
  bool isToggled = false;
  double size = 26;
  double innerPadding = 0;

  @override
  void initState() {
    innerPadding = size / 5;
    isToggled = widget.isActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isToggled = !isToggled);
        widget.onToggled(isToggled);
      },
      onPanEnd: (b) {
        setState(() => isToggled = !isToggled);
        widget.onToggled(isToggled);
      },
      child: AnimatedContainer(
        height: size,
        width: size * 2,
        padding: EdgeInsets.all(innerPadding),
        alignment: isToggled ? Alignment.centerRight : Alignment.centerLeft,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isToggled ? AppColors.secondary : AppColors.hintColor,
        ),
        child: Container(
          width: size - innerPadding * 2,
          height: size - innerPadding * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
