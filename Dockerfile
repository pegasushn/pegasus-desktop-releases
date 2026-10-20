# download.pegasus.hn: liefert die Update-Dateien (latest.yml) aus und leitet Installer-Downloads
# auf die GitHub-Releases dieses Repos weiter. Die großen Dateien liegen nie auf dem Server.
FROM nginx:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY site /usr/share/nginx/html
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://127.0.0.1/healthz || exit 1
