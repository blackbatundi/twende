import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:twende/services/extentions.dart';
import 'package:twende/services/style.dart';

bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

class SimpleTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final bool autofocus;
  final Function(String)? onSubmited;
  final Function(String)? onChanged;
  final TextInputType? keybordType;
  final IconData? icon;
  const SimpleTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.autofocus = false,
    this.onSubmited,
    this.onChanged,
    this.keybordType,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).primaryColor,
      keyboardType: keybordType,
      autofocus: autofocus,
      controller: controller,
      onSubmitted: onSubmited,
      onChanged: onChanged,
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(17),
        isDense: true,
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.all(6),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDarkMode(context)
                        ? const Color(0xFFDEDFEA)
                        : AppStyle.PRIMERYCOLOR.withOpacity(
                            .2,
                          ),
                  ),
                  child: Icon(
                    icon,
                    color: AppStyle.PRIMERYCOLOR,
                  ),
                ),
              )
            : null,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class ShowBottomSheet {
  static Future showBottomSheetModel(BuildContext context,
      {required Widget child}) async {
    // Show the modal bottom sheet and store the result
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: 0,
          left: AppStyle.SPACING_SM,
          right: AppStyle.SPACING_SM,
        ),
        child: child,
      ),
    );

    return result;
  }
}

class DateTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final bool autofocus;
  final IconData? icon;
  const DateTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.autofocus = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).primaryColor,
      keyboardType: TextInputType.number,
      autofocus: autofocus,
      controller: controller,
      inputFormatters: [
        MaskTextInputFormatter(
          mask: '##/##/####',
          filter: {"#": RegExp(r'\d')},
        ),
      ],
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.all(17),
        isDense: true,
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.all(6),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDarkMode(context)
                        ? const Color(0xFFDEDFEA)
                        : AppStyle.PRIMERYCOLOR.withOpacity(
                            .2,
                          ),
                  ),
                  child: Icon(
                    icon,
                    color: AppStyle.PRIMERYCOLOR,
                  ),
                ),
              )
            : null,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class CountryPicker extends StatefulWidget {
  final String? hintText;
  final String? labelText;

  final IconData? icon;
  final Function(Country country)? onChanged;
  const CountryPicker({
    super.key,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.icon,
  });

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  Country? sCountry;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppStyle.SPACING_LG),
          child: Text(
            widget.labelText!,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodySmall?.color,
              fontSize: 12,
            ),
          ),
        ),
        AppStyle.SPACING_XXS.heightBox,
        InkWell(
          onTap: () {
            showCountryPicker(
              context: context,
              countryListTheme: CountryListThemeData(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),

              showPhoneCode: false,
              // optional. Shows phone code before the country name.

              onSelect: (Country country) {
                sCountry = country;
                widget.onChanged?.call(country);
              },
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: sCountry != null ? 8 : 12, horizontal: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).disabledColor,
              borderRadius: BorderRadius.circular(AppStyle.RADIUS_LG),
            ),
            child: Row(
              children: [
                if (widget.icon != null)
                  sCountry != null
                      ? Text(
                          sCountry!.flagEmoji,
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        )
                      : Icon(widget.icon),
                if (widget.icon != null) AppStyle.SPACING_SM.widthBox,
                Expanded(
                  child: Text(
                    sCountry?.name ?? widget.hintText!,
                  ),
                ),
                AppStyle.SPACING_SM.widthBox,
                const Icon(
                  Icons.arrow_drop_down,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PassWordTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final bool autofocus;
  final IconData? icon;

  const PassWordTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.autofocus = false,
    this.icon,
  });

  @override
  State<PassWordTextField> createState() => _PassWordTextFieldState();
}

class _PassWordTextFieldState extends State<PassWordTextField> {
  ValueNotifier<bool> isObscure = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isObscure,
      builder: (context, bool obscureText, child) {
        return TextField(
          obscuringCharacter: "●",
          cursorColor: Theme.of(context).primaryColor,
          autofocus: widget.autofocus,
          obscureText: obscureText,
          controller: widget.controller,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(17),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            isDense: true,
            labelText: widget.labelText,
            prefixIcon: widget.icon != null
                ? Padding(
                    padding: const EdgeInsets.all(6),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDarkMode(context)
                            ? const Color(0xFFDEDFEA)
                            : AppStyle.PRIMERYCOLOR.withOpacity(
                                .2,
                              ),
                      ),
                      child: Icon(
                        widget.icon,
                        color: AppStyle.PRIMERYCOLOR,
                      ),
                    ),
                  )
                : null,
            suffix: InkWell(
              onTap: () {
                isObscure.value = !isObscure.value;
              },
              child: Icon(
                obscureText ? Iconsax.eye : Iconsax.eye_slash,
                size: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}



