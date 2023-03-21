import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isChecked = false;
  double _value = 0.5;

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;

    var platformName = '';
    if (kIsWeb) {
      platformName = "Web";
    } else {
      if (platform == TargetPlatform.android) {
        platformName = "Android";
      } else if (platform == TargetPlatform.iOS) {
        platformName = "IOS";
      } else if (platform == TargetPlatform.fuchsia) {
        platformName = "Fuchsia";
      } else if (platform == TargetPlatform.linux) {
        platformName = "Linux";
      } else if (platform == TargetPlatform.macOS) {
        platformName = "MacOS";
      } else if (platform == TargetPlatform.windows) {
        platformName = "Windows";
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Adaptive Widgets Demo')),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Estás ejecutando la apliacción en un sistema:\n${platformName}',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text('Algunos widgets adaptativos:'),
              //////////////////////////////////////
              const Text('slider:'),
              Slider.adaptive(
                  value: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  }),
              const SizedBox(height: 10),
              //////////////////////////////////////
              Text('switch:'),
              Switch.adaptive(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value;
                  });
                },
              ),
              //////////////////////////////////////
              Text('progress indicator:'),
              CircularProgressIndicator.adaptive(),
              const SizedBox(height: 10),
              //////////////////////////////////////
              const Text('iconos:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.adaptive.arrow_back),
                  Icon(Icons.adaptive.arrow_forward),
                  InkWell(
                      onTap: () {}, child: Icon(Icons.adaptive.flip_camera)),
                  Icon(Icons.adaptive.more),
                  Icon(Icons.adaptive.share),
                ],
              ),
              const SizedBox(height: 10),
              //////////////////////////////////////
              // Los botones y diálogos no son adaptativos, podemos seleccionar el
              // botón adecuado en función de la plataforma destino.
              const Text('Botones y dialogos:'),
              Center(
                child: platform == TargetPlatform.iOS ||
                        platform == TargetPlatform.macOS
                    ? CupertinoButton.filled(
                        onPressed: () => showDialog(
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: const Text('Title'),
                                content: const Text('Body'),
                                actions: [
                                  CupertinoDialogAction(
                                    child: const Text('OK'),
                                    onPressed: () => Navigator.pop(context),
                                  )
                                ],
                              );
                            },
                            context: context),
                        child: const Text('iOS Button'),
                      )
                    : ElevatedButton(
                        onPressed: () => showDialog(
                          builder: (context) => AlertDialog(
                            title: const Text('Title'),
                            content: const Text('Body'),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                          context: context,
                        ),
                        child: const Text('Android Button'),
                      ),
              ),
            ]),
      ),
    );
  }
}
