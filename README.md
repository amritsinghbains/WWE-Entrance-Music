# WWE-Entrance-Music
A script which plays music/ringtone when a person is connected to a WiFi network

# Pre-requists

1. Download nmap http://nmap.org/download.html
2. Install NodeJS https://nodejs.org/download/
3. Install NodeJS Plugin nplay npm install -g nplay 

# Usage

Add this line in the "do-while" block

if [ "$computer" = "MAC ADDRESS OF THE MOBILE/COMPUTER" ]; then
    
    #windows
		
		start FILENAME_OF_SONG_TO_BE_PLAYED &
		
		#mac
    
    #fplay FILENAME_OF_SONG_TO_BE_PLAYED &

fi

# Example

MAC ADDRESS = 84:63:D6:08:1D:B5

SONG TO PLAY =kane.mp3

if [ "$computer" = "84:63:D6:08:1D:B5" ]; then

	  #windows

		start kane.mp3 &

		#mac

    #fplay kane.mp3 &

fi
