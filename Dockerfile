FROM nginx:alpine

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy app files
COPY piki_metronome.html /usr/share/nginx/html/index.html
COPY manifest.json /usr/share/nginx/html/manifest.json
COPY sw.js /usr/share/nginx/html/sw.js
COPY nginx.conf /etc/nginx/templates/default.conf.template

# Railway sets $PORT at runtime; default to 80 for local Docker
ENV PORT=80

EXPOSE 80

# Use envsubst to inject $PORT into nginx config at container start
CMD ["/bin/sh", "-c", "envsubst '$PORT' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
