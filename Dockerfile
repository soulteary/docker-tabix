FROM "nginx:1.19.6-alpine"

ENV TABIX_VER 18.07.1

RUN curl -L https://github.com/tabixio/tabix/archive/${TABIX_VER}.tar.gz -o tabix-${TABIX_VER}.tar.gz && \
    tar zxvf tabix-${TABIX_VER}.tar.gz && \
    cp -r /tabix-${TABIX_VER}/build/* /usr/share/nginx/html/ && \
    rm -rf /tabix-18.07.1*
