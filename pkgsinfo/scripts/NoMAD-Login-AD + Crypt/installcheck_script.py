#!/usr/bin/python

'''This installcheck script template evaluates the installed version
of NoMAD-Login-AD as well as if it is included properly in the authdb.'''

from subprocess import check_output
from distutils.version import StrictVersion
import plistlib
import os

def get_mechs():
  '''returns a list of all current authdb mechs'''
  cmd = ["/usr/bin/security", "authorizationdb", "read", "system.login.console"]
  cur_mech_plist = plistlib.readPlistFromString(check_output(cmd))
  mechs_only = cur_mech_plist['mechanisms']
  return mechs_only

def get_noload_vers():
  '''returns the installed version of the NoMAD-Login-AD bundle'''
  plist = plistlib.readPlist("/Library/Security/SecurityAgentPlugins/NoMADLoginAD.bundle/Contents/Info.plist")
  return plist["CFBundleShortVersionString"]

def main():
  '''Checks if NoMAD-Login-AD is properly installed and up to date. Note that the
  version var below will need to be updated with proper version number.'''

  pkg_vers = '1.3.0'

  install_items = ['/usr/local/bin/authchanger',
                   '/Library/Security/SecurityAgentPlugins/NoMADLoginAD.bundle']
  for item in install_items:
      if not os.path.exists(item):
          # we are missing a needed file - NoMAD-Login-AD is damaged or not installed
          exit(0)

  # check if NoMAD-Login-AD is up to date
  installed_vers = get_noload_vers()
  if StrictVersion(installed_vers) < StrictVersion(pkg_vers):
      # we are out of date compared to the pkg version
      exit(0)

  mechs = ['NoMADLoginAD:CheckAD',
           'NoMADLoginAD:PowerControl,privileged',
           'NoMADLoginAD:EULA',
           'NoMADLoginAD:CreateUser,privileged',
           'NoMADLoginAD:DeMobilize,privileged',
           'NoMADLoginAD:EnableFDE,privileged',
           'NoMADLoginAD:SierraFixes,privileged',
           'NoMADLoginAD:KeychainAdd,privileged']

  current_mechs = get_mechs()
  for noload_mechs in mechs:
      if not noload_mechs in current_mechs:
          # mechs are not in place
          exit(0)

  # all mechs in place and version is up to date
  exit(1)

if __name__ == "__main__":
  main()
