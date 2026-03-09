# create-pacakge

> Create a new Dart package using the Very Good Dart Package brick (Mason).

This command is available in chat as `/create-pacakge`.

## Usage

When the user runs `/create-pacakge`:

1. **Get from the user:**
   - `package_name` – name of the package (e.g. `my_utils`, `cos_shared`)
   - `package_location` – parent directory for the package (e.g. `packages`)

   The package is created at **`package_location/package_name`** (e.g. `packages/cos_shared`).

2. **Generate the package description.**  
   Infer a short, clear description from the package name and context (e.g. for `cos_shared` → "Shared utilities and types for the Cos project"). Use one sentence, no period at the end, suitable for `--description`.

3. **Run the Mason command** from the repository root:

   ```bash
   mason make very_good_dart_package \
     --project_name <package_name> \
     --description "<package_description>" \
     -o <package_location>/<package_name>
   ```

   Replace:
   - `<package_name>` with the user’s package name
   - `<package_description>` with the generated description (quote it so spaces are safe)
   - `<package_location>` with the user’s parent directory; the full output path is `package_location/package_name`

4. **Confirm.** Tell the user the package was created at `package_location/package_name` and remind them to add it to the workspace or `pubspec.yaml` if needed.

## Prerequisites

- [Mason](https://pub.dev/packages/mason_cli) installed: `dart pub global activate mason_cli`
- Very Good Dart Package brick available (e.g. `mason add very_good_dart_package` or use the official brick by name)

## Example

User: "Create package `cos_shared` in `packages`"

- **package_name:** `cos_shared`
- **package_location:** `packages` → output path: `packages/cos_shared`
- **package_description:** (generated) e.g. `Shared utilities, models, and types for the Cos project`
- **Command:**

  ```bash
  mason make very_good_dart_package \
    --project_name cos_shared \
    --description "Shared utilities, models, and types for the Cos project" \
    -o packages/cos_shared
  ```
