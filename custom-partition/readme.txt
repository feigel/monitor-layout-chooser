How-to use IGEL custom partitions
IGEL custom partitions are delivered as a zip archive.  The archive has the following content:
-igel : folder containing patches and UMS profiles
-target : folder containing Custom Partition (inf and tar.bz2 files)
-disclaimer.txt : disclaimer note
-readme.txt: Short Installation guide

Steps to deploy the Custom Partition

1.	Copy the contents of the folder target into the ums_filetransfer folder on the UMS Server (e.g C:\Program Files (x86)\IGEL\RemoteManager\rmguiserver\webapps\ums_filetransfer)
2.	Check the accessibility of the data using Internet browser. (e.g: https://<ums-server>:8443/ums_filetransfer/monitor-layout-chooser.inf
3.	Import the profile (profiles.zip) into the UMS via: "System->Import->Import Profiles". The imported profile should now appear in UMS under Profiles.
4.	Edit the profile and adopt the settings according to your environment under System->Firmware Customization->Custom Partition->Download
	a.	https://<ums-server>:8443/ums_filetransfer/monitor-layout-chooser.inf
	b.	Username: <ums-username> 
	c.	Password: <ums-password>
5. 	Edit the profile and turn on the automatic daemon if so required under System->Firmware Customization->Environment Variables->Predefined
	a. Variable: MONITORLAYOUTDAEMON
	b. Value: 1 for ENABLED -- 0 for DISABLED
6. 	Edit the profile and turn on the debug if so required under System->Firmware Customization->Environment Variables->Predefined (puts data in dmesg)
	a. Variable: MONITORLAYOUTDEBUG
	b. Value: 1 for ENABLED -- 0 for DISABLED
7.	Assign the profile to Thin Client(s).
8.	Restart the TC after deployment of the CP. (not necessary, but...)
