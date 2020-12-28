# pspdfkit-cookiecutters

Various PSPDFKit-related cookiecutters for use with https://github.com/cookiecutter/cookiecutter.

# Usage

* Make sure to install cookiescutter from https://github.com/cookiecutter/cookiecutter
* Run any of the given cookiecutters to have a fresh PSPDFKit-enabled project, for example:

  ```shell
  # This creates a PSPDFKit Flutter example. Use any of the cookiecutters from the pantry.
  $ cookiecutter gh:davidschreiber/pspdfkit-cookiecutters --directory flutter-example
  project_name [myapp]:
  Running "flutter pub get" in myapp...                              0,6s
 
  # That's it. You can now run the PSPDFKit Flutter example.
  $ cd myapp && flutter run
  ```

# Pantry

* `flutter-example` - a simple example app using https://github.com/PSPDFKit/pspdfkit-flutter
