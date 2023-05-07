# rickymorty_app

Ejemplo de aplicación que obtiene datos de una API con Provider y distintos métodos:
- Characters: con una vista Statefull, se pide que actualice los datos en el init de la vista.
- Locations: con una vista Statless, un botón que llama al método que hace el fetch y un consumer en el widget que quieres actualizar.
- Episodes: con una vista stateless y un provider que llama al fetch en su constructor.

También hay un ejemplo de FutureBuilder al final de las vistas de Locations, con Future Builder se podría llamar al fetch sin provider (para que funcione tendríais que comentar el notifyListeners del provider, de hecho, no hace falta provider, podríais crear un service con las llamadas a la API).

He dejado un ejemplo de NetworkImage que muestra un spinner hasta que la imagen se carga en la carpeta Widgets, pero no lo he utilizado en la app (creo que es mejor que los FadeInImages, no necesita un AsssetImage y es adaptativo).

## Posibles mejoras
- Añadir preferencias de usuario para almacenar cosas como el ThemeMode (shared_preferences).
- Scrollinfinito en las listas de personajes/localizaciones/episodios.
- El layout ya es algo adaptatativo y responsivo, pero se pueden añadir cosas como un drawer para la info del usuario o utilizar https://pub.dev/packages/flutter_adaptive_scaffold.
- La navegación a la vista detalle dirige a una nueva vista (Screen), para que aparezca dentro del layout del home_screen habría que implementar algo así: https://medium.com/coding-with-flutter/flutter-case-study-multiple-navigators-with-bottomnavigationbar-90eb6caa6dbf.
Estas mejoras son sencillas, no las he incluido para no complicar el código, pero mejorarían la apariencia de la aplicación completa. Espero que os sirva como base para vuestras aplicaciones.
