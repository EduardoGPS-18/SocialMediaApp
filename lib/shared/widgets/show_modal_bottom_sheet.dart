import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomShowModalBottomSheet extends StatefulWidget {
  Size size;
  bool commentIsUser;
  Function()? onConfirmDelete;

  CustomShowModalBottomSheet({
    Key? key,
    required this.size,
    required this.commentIsUser,
    this.onConfirmDelete,
  }) : super(key: key);

  @override
  State<CustomShowModalBottomSheet> createState() => _CustomShowModalBottomSheetState();
}

class _CustomShowModalBottomSheetState extends State<CustomShowModalBottomSheet> {
  Future<bool?> _showModal() {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Icon(
          Icons.warning,
          color: Theme.of(context).colorScheme.primary,
          size: 40,
        ),
        content: const Text(
          "Você deseja excluir?",
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("Não"),
          ),
          TextButton(
            onPressed: () {
              if (widget.onConfirmDelete != null) {
                widget.onConfirmDelete!();
              }
              Navigator.of(context).pop(true);
            },
            child: const Text("Sim"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet<bool>(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.0),
            ),
          ),
          context: context,
          builder: (context) => SizedBox(
            height: 200,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: widget.size.height * 0.015,
                    bottom: widget.size.height * 0.08,
                  ),
                  child: Container(
                    height: widget.size.height * 0.018,
                    width: widget.size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface.withAlpha(60),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: SizedBox(
                    width: widget.size.width * 08,
                    child: ElevatedButton(
                      onPressed: () async {
                        final bool? res = await _showModal();
                        if (res != null && res) {
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text("Excluir"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      icon: widget.commentIsUser ? const Icon(Icons.more_vert) : const SizedBox(),
    );
  }
}
