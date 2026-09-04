#  City Explorer - Flutter UI App

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

Aplicación móvil desarrollada en Flutter que funciona como un catálogo interactivo de ciudades. El proyecto está enfocado en demostrar buenas prácticas de UI/UX, navegación y manejo del estado local en el ecosistema de Flutter.

##  Características Técnicas Destacadas

Este proyecto no es solo visual, sino que implementa mecánicas clave del framework:

*   **Animaciones `Hero`:** Transiciones fluidas de imágenes entre la lista de ciudades y la pantalla de detalle, mejorando significativamente la experiencia de usuario.
*   **Gestión de Estado (State Management):** Uso de `StatefulWidget` y paso de funciones callback (`VoidCallback`) entre pantallas hijas y padres para gestionar el borrado dinámico de elementos de la lista y actualizar la interfaz con `setState`.
*   **Formularios y Validación:** Pantalla de login con `GlobalKey<FormState>` y `TextEditingController` para validar credenciales (campos obligatorios, longitud mínima y requerimientos alfanuméricos) mostrando feedback al usuario mediante `SnackBar`.
*   **Renderizado Eficiente:** Implementación de `ListView.builder` para la carga diferida (lazy loading) de los elementos de la interfaz.

##  Flujo de la Aplicación

1.  **Splash Screen:** Pantalla de carga inicial con temporizador (`Future.delayed`) y reemplazo de ruta en el historial.
2.  **Login:** Simulación de autenticación (Credenciales de prueba: *Usuario:* `user` / *Contraseña:* `pass12345`).
3.  **Listado de Ciudades:** Tarjetas personalizadas (Cards) con sombras, bordes redondeados y avatares circulares que reciben el nombre del usuario logueado.
4.  **Detalle:** Vista ampliada de la ciudad con opción para eliminar el registro mediante un `AlertDialog` de confirmación.

##  Tecnologías

*   **Framework:** Flutter
*   **Lenguaje:** Dart
*   **Navegación:** Rutas nombradas (`/login`) y `MaterialPageRoute` para el paso dinámico de argumentos.
*   **Recursos:** Gestión de assets locales (imágenes).


##  Cómo ejecutar el proyecto

1. Clona el repositorio: `git clone https://github.com/Dianathecoder/App_Flutter.git`
2. Navega al directorio del proyecto y descarga las dependencias:
   ```bash
   flutter pub get
