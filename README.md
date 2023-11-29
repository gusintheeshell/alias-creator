# Alias Creator

This project provides two methods for creating aliases for projects in your shell environment. Choose the method that best suits your preferences.

## Method 1: Command Line Interface (CLI)

### Usage CLI

1. Download the script for your system:

   ```bash
   $ wget https://raw.githubusercontent.com/gusbdev/alias-creator/main/create_alias.sh
   ```

2. Give execute permission to the script:

   ```bash
   $ chmod +x create_alias.sh
   ```

3. Run the script and provide the full path to your shell configuration file (e.g., ~/.bashrc):

   ```bash
   $ ./create_alias.sh ~/.bashrc
   ```

4. Follow the interactive instructions to add projects and create aliases.

5. Restart the terminal or run source <your-configuration-file> to apply the changes.

## Method 2: Command Line Interface with Dialog (CLI)

### Usage Dialog (CLI)

1. Download the script for your system:

   ```bash
   $ wget https://raw.githubusercontent.com/gusbdev/alias-creator/main/create_alias_cli.sh

   ```

2. Give execute permission to the script:

   ```bash
   $ chmod +x create_alias_cli.sh
   ```

3. Run the script to open the interactive CLI:

   ```bash
   $ ./create_alias_cli.sh
   ```

4. Use the menu to add projects and create aliases in a more interactive way.

5. Follow the instructions and exit the CLI when done.

## Contributing

Feel free to contribute improvements, bug fixes, or new features. Open an issue to discuss major changes and submit pull requests for minor fixes.
