FROM debian:bookworm-20230411-slim

RUN apt-get update \
  && apt-get install -y bc sudo cron mplayer ffmpeg pulseaudio \
  && apt-get -y clean && rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 player

COPY --chmod=644 cron.d/* /etc/cron.d
COPY --chmod=755 play.sh /app/play.sh

RUN ln -sf /proc/1/fd/1 /var/log/cron.log

CMD ["/usr/sbin/cron", "-f"]
