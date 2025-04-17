# Template for Windows Batch Script

This is a batch (.bat) script template, providing command-line arguments and flags.

> [!IMPORTANT]
> Quick reminder: open Command Prompt (CMD) before running the script. It will not be recognized on a bash terminal - for obvious reasons.

## HOW TO RUN

1. Open the command prompt (cmd).
2. In it, run `cd <path>`. `<path>` being the folder where the `template.bat` is.
3. Run `template.bat --help` to show the script's instructions, as below:

```
HOW TO USE:
  template.bat [-f] [flag value] [required argument] [optional argument]

  -h, --help shows this help
  -v, --version shows the version
  -f, --flag [value] specifies a named parameter value
```

## HOW TO EDIT

1. Fork this repository and/or download/copy its content.
2. I left comments at specific parts of the script to help find where to put your code.
3. Remember to remove the comments before running the script in a production environment.
