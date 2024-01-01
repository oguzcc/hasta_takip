part of '../input.dart';

class _BoardSearchBar extends StatelessWidget {
  const _BoardSearchBar({required TextEditingController controller})
      : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onTapOutside: onTapOutside(context),
      textAlignVertical: TextAlignVertical.bottom,
      style: context.textTheme.footnoteRegular?.copyWith(
        color: context.color.labelLightPrimary,
      ),
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: context.textTheme.footnoteRegular?.copyWith(
          color: context.color.labelLightTeartly,
        ),
        filled: true,
        constraints: BoxConstraints(
          minHeight: 48.h,
          maxHeight: 48.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.r),
          borderSide: BorderSide.none,
        ),
        prefixIconConstraints: BoxConstraints.tight(
          const Size.fromWidth(40),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Icon(
            NyIcons.search,
            size: 16,
            color: context.color.labelLightTeartly,
          ),
        ),
      ),
    );
  }
}
