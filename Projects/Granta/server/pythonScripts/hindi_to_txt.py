import yt_dlp
import whisper
import os

# # 1️⃣ YouTube URL
# youtube_url = "https://youtube.com/shorts/MxoonR572Bo?si=ypTFppZ3s8LR8knD"

# # 2️⃣ Download audio from YouTube
# ydl_opts = {
#     'format': 'bestaudio/best',
#     'outtmpl': 'audio.%(ext)s',
#     'postprocessors': [{
#         'key': 'FFmpegExtractAudio',
#         'preferredcodec': 'wav',
#     }],
# }

# with yt_dlp.YoutubeDL(ydl_opts) as ydl:
#     ydl.download([youtube_url])

# print("Audio downloaded successfully.")

# 3️⃣ Load Whisper model

model = whisper.load_model("medium", device="cpu")  # use "large" for best accuracy

# 4️⃣ Transcribe Hindi
result = model.transcribe("tal_tal.wav", language="hi")

print("\nExtracted Lyrics:\n")
print(result["text"])

# 5️⃣ Save to file
with open("lyrics.txt", "w", encoding="utf-8") as f:
    f.write(result["text"])

print("\nLyrics saved to lyrics.txt")
