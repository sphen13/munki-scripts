#!/bin/bash

mkdir -p /Library/Application\ Support/Adobe/AAMUpdaterInventory/1.0
cat <<EOF > /Library/Application\ Support/Adobe/AAMUpdaterInventory/1.0/AdobeUpdaterAdminPrefs.dat
<?xml version="1.0" encoding="UTF-8" ?>
         
    <Preferences>
         
    <Suppressed>1</Suppressed>
         
    </Preferences>
EOF

mkdir -p /Library/Application\ Support/Adobe/OOBE/Configs
cat <<EOF > /Library/Application\ Support/Adobe/OOBE/Configs/ServiceConfig.xml
<config><panel><name>AppsPanel</name><visible>false</visible></panel><feature><name>SelfServeInstalls</name><enabled>false</enabled></feature></config>
EOF

exit 0