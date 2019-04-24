#!/usr/bin/python

import os
import platform
import plistlib
import subprocess
import sys
from subprocess import PIPE, STDOUT, Popen, check_output
from distutils.version import StrictVersion

system_login_console_plist = "/private/var/tmp/system.login.console.plist"

## Mechs that support FV2AuthPlugin
fv2_mechs = ["Crypt:Check,privileged","Crypt:CryptGUI","Crypt:Enablement,privileged"]
fv2_index_mech = "loginwindow:done"
fv2_index_offset = 0

def get_mechs():
    '''returns a list of all current authdb mechs'''
    cmd = ["/usr/bin/security", "authorizationdb", "read", "system.login.console"]
    cur_mech_plist = plistlib.readPlistFromString(check_output(cmd))
    mechs_only = cur_mech_plist['mechanisms']
    return mechs_only

def bash_command(script):
    try:
        return subprocess.check_output(script)
    except (subprocess.CalledProcessError, OSError), err:
        sys.exit("[* Error] **%s** [%s]" % (err, str(script)))

def remove_mechs_in_db(db, mech_list):
    for mech in mech_list:
        for old_mech in filter(lambda x: mech in x, db['mechanisms']):
            db['mechanisms'].remove(old_mech)
    return db

def set_mechs_in_db(db, mech_list, index_mech, index_offset):
    ## Clear away any previous configs
    db = remove_mechs_in_db(db, mech_list)

    ## Add mech_list to db
    i = int(db['mechanisms'].index(index_mech)) + index_offset
    for mech in mech_list:
        db['mechanisms'].insert(i, mech)
        i += 1
    return db

def edit_authdb():
    ## Export "system.login.console"
    system_login_console = bash_command(["/usr/bin/security", "authorizationdb", "read", "system.login.console"])
    f_c = open(system_login_console_plist, 'w')
    f_c.write(system_login_console)
    f_c.close()

    ## Export "authenticate"
    #authenticate = bash_command(["/usr/bin/security", "authorizationdb", "read", "authenticate"])
    #f_a = open(authenticate_plist, 'w')
    #f_a.write(authenticate)
    #f_a.close()

    ## Leave the for loop. Possible support for ScreenSaver unlock
    for p in [system_login_console_plist]:
        ## Parse the plist
        d = plistlib.readPlist(p)

        ## Add FV2 mechs
        d = set_mechs_in_db(d, fv2_mechs, fv2_index_mech, fv2_index_offset)

        ## Write out the changes
        plistlib.writePlist(d, p)

    f_c = open(system_login_console_plist, "r")
    p = Popen(["/usr/bin/security", "authorizationdb", "write", "system.login.console"], stdout=PIPE, stdin=PIPE, stderr=PIPE)
    stdout_data = p.communicate(input=f_c.read())
    f_c.close()

    #f_a = open(authenticate_plist, "r")
    #p = Popen(["/usr/bin/security", "authorizationdb", "write", "authenticate"], stdout=PIPE, stdin=PIPE, stderr=PIPE)
    #stdout_data = p.communicate(input=f_a.read())
    #f_a.close()

def main():
    '''Checks if Crypt is installed and mechs in place. Fixes mechs if needed.'''

    install_items = ['/Library/Security/SecurityAgentPlugins/Crypt.bundle',
                     '/Library/LaunchDaemons/com.grahamgilbert.crypt.plist',
                     '/Library/Crypt/checkin',
                     '/Library/Security/SecurityAgentPlugins/Crypt.bundle']
    for item in install_items:
        if not os.path.exists(item):
            # we are missing a needed file - Crypt is damaged or not installed - exit
            exit(0)

    mechs = ['Crypt:Check,privileged', 'Crypt:CryptGUI', 'Crypt:Enablement,privileged']
    current_mechs = get_mechs()
    for crypt_mech in mechs:
        if not crypt_mech in current_mechs:
            # mechs are not in place - fix them
            edit_authdb()
            exit(0)

    # all mechs in place
    exit(0)

if __name__ == "__main__":
    main()
