ARG BUILD_FROM
FROM ${BUILD_FROM}

# Set environment variables for Home Assistant integration
ENV FLASK_PORT=8084
ENV INGEST_DIR=/media/shelfmark
ENV PUID=0
ENV PGID=0

# Create the books directory
RUN mkdir -p /media/shelfmark

# Copy run script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Set the entrypoint
CMD ["/run.sh"]
