FROM "nginx:1.19.6-alpine"

ENV TABIX_VER 18.07.1

RUN curl -L https://github.com/tabixio/tabix/archive/${TABIX_VER}.tar.gz -o tabix-${TABIX_VER}.tar.gz && \
    tar zxvf tabix-${TABIX_VER}.tar.gz && \
    cp -r /tabix-${TABIX_VER}/build/* /usr/share/nginx/html/ && \
    rm -rf /tabix-18.07.1*

ENV APP_VER 721d08f0a8

RUN curl -L https://cdn.plot.ly/plotly-1.2.0.min.js -o /usr/share/nginx/html/scripts/plotly-1.2.0.min.js && \
    cat /usr/share/nginx/html/index.html | sed -e "s/https:\/\/cdn.plot.ly/\/scripts/" | tee /usr/share/nginx/html/index.html && \
    cat /usr/share/nginx/html/styles/app-${APP_VER}.css | sed -e "s/https:\/\/fonts.googleapis.com\/css?family=Inconsolata//" | sed -e "s/@import url();//" | cat /usr/share/nginx/html/styles/app-${APP_VER}.css
