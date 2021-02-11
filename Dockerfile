FROM "nginx:1.19.6-alpine"

ENV TABIX_VER 18.07.1

RUN curl -L https://github.com/tabixio/tabix/archive/${TABIX_VER}.tar.gz -o tabix-${TABIX_VER}.tar.gz && \
    tar zxvf tabix-${TABIX_VER}.tar.gz && \
    cp -r /tabix-${TABIX_VER}/build/* /usr/share/nginx/html/ && \
    rm -rf /tabix-18.07.1*

# Patch index.html
RUN curl -L https://cdn.plot.ly/plotly-1.2.0.min.js -o /usr/share/nginx/html/scripts/plotly-1.2.0.min.js && sed -i "s/https:\/\/cdn.plot.ly/\/scripts/" /usr/share/nginx/html/index.html
# Remove webfont from CDN
ENV APP_VER 721d08f0a8
RUN sed -i "s/https:\/\/fonts.googleapis.com\/css?family=Inconsolata//" /usr/share/nginx/html/styles/app-${APP_VER}.css && \
    sed -i "s/@import url();//" /usr/share/nginx/html/styles/app-${APP_VER}.css
