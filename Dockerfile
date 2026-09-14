FROM n8nio/n8n:latest

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 py3-pip ffmpeg wget ca-certificates && \
    wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER node
