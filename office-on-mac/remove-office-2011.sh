#!/bin/bash

# per https://support.microsoft.com/en-us/help/2398768/how-to-completely-remove-office-for-mac-2011

rm -rf '/Applications/Microsoft Office 2011'
rm -rf $HOME/Library/Preferences/com.microsoft*
rm -rf /Library/PrivilegedHelperTools/com.microsoft.office.licensing.helper
rm -rf /Library/Preferences/com.microsoft.office.licensing.plist
rm -rf $HOME/Library/Preferences/ByHost/com.microsoft*
rm -rf '/Library/Application Support/Microsoft'
rm -rf /Library/Receipts/Office2011_*
rm -rf /private/var/db/receipts/com.microsoft.office*
rm -rf '$HOME/Library/Application Support/Microsoft/Office'
mv '$HOME/Documents/Microsoft User Data' $HOME/Desktop/MSUserData
