"""Extend sqlite3 Cursor with context management and parameter replacement.

This module is a hack. Normally, you don't use "with" statements on sqlite3
objects, because sqlite3 is not resource intensive. However, this web app is
meant to show differences between mysql, postgresql, and sqlite. So the code
needs to be written in a way that works for all three systems.

The classes below allow sqlite3 cursors to be used in with statements. Also,
"%s" parameters in SQL statements are replaced with "?" for compatibility.
"""

import sqlite3


class CustomCursor(sqlite3.Cursor):

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        self.close()

    def execute(self, sql, parameters=(), /):
        sql = sql.replace("%s", "?")
        return super().execute(sql, parameters)


class CustomConnection(sqlite3.Connection):

    def cursor(self, *args, **kwargs):
        return super().cursor(factory=CustomCursor, *args, **kwargs)
