"""Find and replace quoted CamelCase names with lowercase."""

import re
import sys


def rewrite(quote, code):
    """Remove quote marks from the given file contents.

    Args:
        quote (str): The quote mark to search for and remove.
        code (str): The contents of an individual source file.

    Returns:
        str: The updated contents of the source file.
    """
    pattern = fr'{quote}([^{quote}]*){quote}'
    return re.sub(pattern, lambda match: match.group(1).lower(), code)


def main(quote, paths):
    """Remove quote marks from each of the given files.

    Args:
        quote (str): The quote mark to search for and remove.
        paths (list): The files to remove quote marks from.
    """
    for path in paths:
        print("Rewriting", path)
        with open(path) as file:
            code = file.read()
        code = rewrite(quote, code)
        with open(path, "w") as file:
            file.write(code)


if __name__ == "__main__":
    if len(sys.argv) > 2:
        main(sys.argv[1], sys.argv[2:])
    else:
        print(f"Usage: {sys.argv[0]} QUOTE_MARK FILE_NAMES")
        print(f"   Ex: {sys.argv[0]} \\\" drop.sql create.sql")
