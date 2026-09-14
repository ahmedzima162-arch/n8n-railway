FROM n8nio/n8n:latest

USER root

# 1. استرجاع مدير الحزم apk المحذوف من صورة n8n
RUN wget -qO /apk.static https://gitlab.alpinelinux.org/api/v4/projects/5/packages/generic/v2.14.4/x86_64/apk.static && \
    chmod +x /apk.static && \
    /apk.static -X http://dl-cdn.alpinelinux.org/alpine/v3.22/main -U --allow-untrusted --initdb add apk-tools && \
    rm /apk.static

# 2. تثبيت بايثون و ffmpeg وتحميل yt-dlp
RUN apk update && \
    apk add --no-cache python3 py3-pip ffmpeg curl && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp

USER node
