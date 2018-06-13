#!/bin/bash

# Things to find/replace:
# example.com
# myusername
# hashcat path(s)
# wordlist path(s)


#1. Volume Shadow Copy to get ntds.dit and SYSTEM
#https://blog.stealthbits.com/extracting-password-hashes-from-the-ntds-dit-file/

# make folder ./dump and put the ntds.dit and SYSTEM files there

#2. secretsdump.py -ntds ./path-to/ntds.dit -system ./path-to/SYSTEM LOCAL
secretsdump.py -ntds ./dump/ntds.dit -system ./dump/SYSTEM LOCAL > dump.txt
#https://blog.ropnop.com/extracting-hashes-and-domain-info-from-ntds-dit/

#4. Do the following to get just the hash:
#	- grep the example.com part, we don't care about machine accounts
#	- cut out all the wrong hash types
#	- cut out everything but the hash, the 4th field
#	- dump into new file
cat dump.txt | grep example.com | \
	grep -v aes256-cts-hmac-sha1-96 | grep -v aes128-cts-hmac-sha1-96 | grep -v des-cbc-md5 | grep -v dec-cbc-crc | grep -v rc4_hmac | \
	cut -d: -f1,4 | sed 's|example.com\\||g' > accounts.txt
cat accounts.txt | cut -d: -f2 > hashes.txt

#5. Crack!
sudo /opt/hashcat/hashcat64.bin -m 1000 -O -w 3 -r /opt/hashcat/rules/leetspeak.rule ./hashes.txt ~/Downloads/wordlist/crackstation-human-only.txt

#6. dump from potfile
sudo cp /opt/hashcat/hashcat.potfile cracked.txt && sudo chown myuser:myuser cracked.txt

#7. combine things
# compare:
grep -Ff hashes.txt accounts.txt > accounts-cracked.txt
grep -Ff hashes.txt cracked.txt > passwords-cracked.txt

# sort both files by hash
sort -k2 -t: accounts-cracked.txt > accounts-cracked_2.txt
sort -k1 -t: passwords-cracked.txt > passwords-cracked_2.txt

# combine:
join -t : -1 2 -2 1 accounts-cracked_2.txt passwords-cracked_2.txt > full-list-with-hashes.txt
cut -d: -f2,3 full-list-with-hashes.txt > full-list_no-hashes.txt

echo "completed"
echo 'please see full-list*.txt'

# ALL DONE
