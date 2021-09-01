import os
import sysconfig

prefix = os.environ["prefix"]
venv = os.environ.get("VIRTUAL_ENV", None)

if venv:
    venv_site_packages = sysconfig.get_path("platlib")
    print(f'prepend-path PYTHONPATH "{venv_site_packages}"')

print(f'setenv VIRTUAL_ENV "{prefix}"')
