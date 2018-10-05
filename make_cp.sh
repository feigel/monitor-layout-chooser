#!/bin/bash
sed -i -e "s/\(version=\"\).*\"$/\1`cat version`\"/" custom-partition/target/monitor-layout-chooser.inf
tar -cjf custom-partition/target/monitor-layout-chooser.tar.bz2 monitor-layout-chooser
scp custom-partition/target/* root@docean-umsdata:/var/www/html/ums_filetransfer/ 
