FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache python3 py3-pip ffmpeg wget && \
    wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp

USER node
