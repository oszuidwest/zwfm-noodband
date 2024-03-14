# StereoTool installeren
wget https://www.stereotool.com/download/stereo_tool_cmd_64 -O /opt/stereotool
chmod +x /opt/stereotool

# FFMmpeg installeren
apt update -y; apt install ffmpeg -y

# Oude noodband verwijderen
rm /tmp/noodband.flac

if [ ! -f "/tmp/noodband.mp3" ]; then
    wget https://zuidwest.app/tmp/noodband.mp3 -O /tmp/noodband.mp3
else
    echo "Bestand /tmp/noodband.mp3 bestaat al. Data is duur op Azure, dus downloaden het niet opnieuw!."
fi

# Boel pipen (verwijder -t 600 voor hele uur, anders 10min)
ffmpeg -hide_banner -i /tmp/noodband.mp3 -t 600 -f wav -acodec pcm_s16le -ar 192000 -ac 2 - | /opt/stereotool -q -r 192000 - - -s st_cleaned.ini | ffmpeg -hide_banner -i - -f wav -ac 1 -ar 192000 /tmp/noodband.flac

# Gegenereerd bestand uploaden
curl --silent bashupload.com -T /tmp/noodband.flac