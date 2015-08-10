#!/bin/bash
#
MUSICROOT=/
function fplay {
if [ $1 = '-v' ]; then
shift 1
find -LE $MUSICROOT -type f -iname "*$**" -iregex '.*\.(3g[2|p]|a(ac|c3|dts|if[c|f]?|mr|nd|u)|caf|m4[a|r]|mp([1-4|a]|eg[0,9]?)|sd2|wav)' -print -exec afplay "{}" \; &
elif [ $1 = '-g' ]; then
shift 1
find -E $MUSICROOT -type f -iname "*$**" -iregex '.*\.(3g[2|p]|a(ac|c3|dts|if[c|f]?|mr|nd|u)|caf|m4[a|r]|mp([1-4|a]|eg[0,9]?)|sd2|wav)' -exec open -a QuickTime\ Player "{}" \; -exec osascript -e 'tell application "QuickTime Player" to play document 1' \; &
else
find -E $MUSICROOT -type f -iname "*$**" -iregex '.*\.(3g[2|p]|a(ac|c3|dts|if[c|f]?|mr|nd|u)|caf|m4[a|r]|mp([1-4|a]|eg[0,9]?)|sd2|wav)' -exec afplay "{}" \; &
fi
}
#Script to monitor the network and put changes to notification
#
echo "Script Started"
for(( ; ; ))
do
	#Save previous scan
	cp scan.txt previousscan.txt
	#get numeric list of online hosts
	nmap -n -sn 192.168.1.2-255 > scan.txt
	#nmap -sU -p 161 -T4 -d -v -n 192.168.1.* > scan.txt
	#collect the difference, only the lines with ip-numbers
	message=$(diff previousscan.txt scan.txt | grep "MAC Address")
	#get first char which indicates if the host came up or went away
	iostring="${message:0:1}"
	#get first ip-number from the list
	computer="${message:15:17}"
	computername="${message:33:50}"



	#show ip-number in notify if host came up
	if [ "$iostring" = \> ]; then
	        echo "$computer, $computername is online"

	        #Put your script here
	        
	        if [ "$computer" = "84:63:D6:08:1D:B5" ]; then
	        	#windows
		        start kane.mp3 &
		        #mac
		        #fplay kane.mp3 &
		    fi	        
	        if [ "$computer" = "B8:5E:7B:EB:47:01" ]; then
	        	#windows
		        start kane.mp3 &
		        #mac
		        #fplay kane.mp3 &
		    fi
        fi
	        
























	        
	#show ip-number in notify if host went away
	if [ "$iostring" = \< ]; then
	        echo "$computer, $computername is offline"
	        #pkill -9 afplay
	    fi
done