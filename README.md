# pspdfkit-cookiecutters

Various PSPDFKit-related cookiecutters for use with https://github.com/cookiecutter/cookiecutter.

# Usage

* Make sure to install cookiescutter from https://github.com/cookiecutter/cookiecutter
* Run any of the given cookiecutters to have a fresh PSPDFKit-enabled project, for example:

  ```shell
  # This creates a PSPDFKit for Android example using Kotlin.
  $ cookiecutter gh:davidschreiber/pspdfkit-cookiecutters --directory android/kotlin
  project_name [pspdfkit-kotlin]:
  application_id [com.pspdfkit.kotlin]:
  pspdfkit_version [6.5.3]:
  pspdfkit_license_key [YOUR_LICENSE_KEY_GOES_HERE]:
  ```

# Pantry

* `android/kotlin` - a simple Kotlin based PSPDFKit example for Android, having a single `PdfActivity`. 
* `flutter/simple` - a simple example app based on the instructions from https://github.com/PSPDFKit/pspdfkit-flutter
* `flutter/catalog` - the Flutter example Catalog available from https://github.com/PSPDFKit/pspdfkit-flutter
