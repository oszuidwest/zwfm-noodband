# FFmpeg installeren
apt update -y; apt install ffmpeg -y

# StereoTool downloaden
wget https://www.stereotool.com/download/stereo_tool_cmd_64 -O /usr/bin/stereotool
chmod +x /usr/bin/stereotool

# Oude noodband verwijderen
rm /tmp/noodband.flac

if [ ! -f "/tmp/noodband.mp3" ]; then
    wget https://audiologger.westeurope.cloudapp.azure.com/2024-02-28_05.mp3 -O /tmp/noodband.mp3
else
    echo "Bestand /tmp/noodband.mp3 bestaat al. Data is duur op Azure, dus downloaden het niet opnieuw!."
fi

# Boel pipen (verwijder -t 60 voor hele uur)
ffmpeg -hide_banner -i /tmp/noodband.mp3 -t 600 -f wav -acodec pcm_s16le -ar 192000 -ac 2 - | stereotool -q -r 192000 - - -s /root/st.ini | ffmpeg -hide_banner -i - -f wav -ac 1 -ar 192000 /tmp/noodband.flac



