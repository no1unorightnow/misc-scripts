#!/bin/bash
# removes office except dock icons
echo "MUST BE RUN AS USER TO FINISH PROPERLY"
sudo rm -rf '/Applications/Microsoft Excel.app'
sudo rm -rf '/Applications/Microsoft Lync.app'
sudo rm -rf '/Applications/Microsoft Messenger.app'
sudo rm -rf '/Applications/Microsoft OneNote.app'
sudo rm -rf '/Applications/Microsoft Outlook.app'
sudo rm -rf '/Applications/Microsoft PowerPoint.app'
sudo rm -rf '/Applications/Microsoft Word.app'
sudo rm -rf $HOME'/Library/Containers/com.microsoft.errorreporting'
sudo rm -rf $HOME'/Library/Containers/com.microsoft.Excel'
sudo rm -rf $HOME'/Library/Containers/com.microsoft.netlib.shipassertprocess'
sudo rm -rf $HOME'/Library/Containers/com.microsoft.Office365ServiceV2'
sudo rm -rf $HOME'/Library/Containers/com.microsoft.Outlook'
sudo rm -rf $HOME'/Library/Containers/com.microsoft.Powerpoint'
sudo rm -rf $HOME'/Library/Containers/com.microsoft.RMS-XPCService'
sudo rm -rf $HOME'/Library/Containers/com.microsoft.Word'
sudo rm -rf $HOME'/Library/Containers/com.microsoft.onenote.mac'
sudo rm -rf $HOME'/Library/Group Containers/UBF8T346G9.ms'
sudo rm -rf $HOME'/Library/Group Containers/UBF8T346G9.Office'
sudo rm -rf $HOME'/Library/Group Containers/UBF8T346G9.OfficeOsfWebHost'
echo done.
