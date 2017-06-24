FROM scratch
WORKDIR /app
COPY target/* /.
CMD ["./app"]
