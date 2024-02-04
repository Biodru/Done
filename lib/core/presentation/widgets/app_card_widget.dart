import 'package:done/features/user_context/data/models/user_context.dart';
import 'package:flutter/material.dart';

class AppCardWidgetAllContexts extends StatelessWidget {
  const AppCardWidgetAllContexts({
    super.key,
    this.currentUserContext,
    required this.borderColor,
    required this.cardBody,
  });

  final UserContext? currentUserContext;
  final Color? borderColor;
  final Widget cardBody;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 2,
      color: Theme.of(context).colorScheme.tertiaryContainer,
      shape: RoundedRectangleBorder(
        side: borderColor != null
            ? BorderSide(
                color: borderColor!,
                width: 2,
              )
            : BorderSide.none,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          currentUserContext != null
              ? Container(
                  width: double.infinity,
                  color: currentUserContext?.contextColor,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      16,
                      4,
                      4,
                      4,
                    ),
                    child: Text(
                      currentUserContext?.contextName ?? '',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: cardBody,
          ),
        ],
      ),
    );
  }
}

class AppCardWidgetForSelectedContext extends StatelessWidget {
  const AppCardWidgetForSelectedContext({
    super.key,
    this.currentUserContext,
    this.borderColor,
    required this.cardBody,
  });

  final UserContext? currentUserContext;
  final Color? borderColor;
  final Widget cardBody;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Theme.of(context).colorScheme.tertiaryContainer,
      shape: RoundedRectangleBorder(
        side: borderColor != null
            ? BorderSide(
                color: borderColor!,
                width: 2,
              )
            : BorderSide.none,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: cardBody,
      ),
    );
  }
}
