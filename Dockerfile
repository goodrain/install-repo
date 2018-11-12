FROM goodrainapps/caddyserver

RUN mkdir -p /pkg/{rpm,deb}

COPY rpm /pkg/rpm

COPY deb /pkg/deb