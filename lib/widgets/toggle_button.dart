import 'package:flutter/material.dart';
import 'text_and_voice_field.dart';

class ToggleButton extends StatefulWidget {
  final VoidCallback _sendTextMessage;
  final VoidCallback _sendVoiceMessage;
  final InputMode _inputMode;
  final bool _isReplying;
  final bool _isListening;
  const ToggleButton({
    super.key,
    required InputMode inputMode,
    required VoidCallback sendTextMessage,
    required VoidCallback sendVoiceMessage,
    required bool isReplying,
    required bool isListening,
  })  : _inputMode = inputMode,
        _sendTextMessage = sendTextMessage,
        _sendVoiceMessage = sendVoiceMessage,
        _isReplying = isReplying,
        _isListening = isListening;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
      ),
      onPressed: widget._isReplying
          ? null
          : widget._inputMode == InputMode.text
              ? widget._sendTextMessage
              : widget._sendVoiceMessage,
      child: Icon(
        widget._inputMode == InputMode.text
            ? Icons.send
            : widget._isListening
                ? Icons.mic_off
                : Icons.mic,
      ),
    );
  }
}
