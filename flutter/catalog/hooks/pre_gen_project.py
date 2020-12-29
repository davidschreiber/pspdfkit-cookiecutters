import re
import sys

PACKAGE_REGEX = r'^[_a-zA-Z][_a-zA-Z0-9]+$'


def verify_project_name():
    project_name = '{{ cookiecutter.project_name }}'
    if not re.match(PACKAGE_REGEX, project_name):
        print('ERROR: %s is not a valid Flutter package name!' % project_name)

        # exits with status 1 to indicate failure
        sys.exit(1)


verify_project_name()
