Keepass_Sync


About
Keepass Sync Script for Powershell

Includes VB script to properly hide the Powershell window when running. This script is from Jeffery Hicks/Sapien.com

Also includes a premade Task Schedule that references the VB script. Configured for 1 minute intervals of running the VB script, which calls the Powershell script.

10-12-2017 - Version 1.0

	• Generates SHA512 signatures for each copy of your keepass database file
	• Syncs to OneDrive & GoogleDrive from Dropbox only if hash is different
	
	
Installation
Script default directory is C:\Scripts

Place Keepass_Sync.ps1, Keepass_Sync_Hide_Window.vbs, & Keepass_Sync_Task_Schedule.xml in C:\Scripts

Adjust path & filename to your cloud storage folders in Keepass_Sync.ps1.

If using directory other than C:\Scripts, Keepass_Sync_Hide_Window.vbs will need to be edited.

Import Keepass_Sync_Task_Schedule.xml into Task Scheduler. Adjust time frequency to desired setting.
