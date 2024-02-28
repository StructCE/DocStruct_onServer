FROM mcr.microsoft.com/dotnet/sdk:7.0 AS builder
WORKDIR /build
COPY . /build
RUN dotnet tool install retypeapp --tool-path /bin
RUN retype build ./Stack-Atual/retype-stack-atual.yml --output .docker-build/stack-atual
RUN retype build ./Diretorias/retype-diretorias.yml --output .docker-build/diretorias
RUN retype build ./Ferramentas-de-Ambiente/retype-ferramentas-de-ambiente.yml --output .docker-build/ferramentas-de-ambiente
RUN retype build ./Stack-Legado/retype-stack-legado.yml --output .docker-build/stack-legado

FROM httpd:latest
COPY --from=builder /build/.docker-build/ /usr/local/apache2/htdocs/

RUN rm /usr/local/apache2/htdocs/index.html
COPY ./index.html /usr/local/apache2/htdocs/
COPY ./style.css /usr/local/apache2/htdocs/
COPY ./favicon.ico /usr/local/apache2/htdocs/