FROM mcr.microsoft.com/dotnet/sdk:7.0 AS builder
WORKDIR /build
COPY . /build
RUN dotnet tool install retypeapp --tool-path /bin
RUN retype build retype-diretorias.yml --output .docker-build/diretorias
RUN retype build retype-execucao.yml --output .docker-build/execucao
RUN retype build retype-ferramentas.yml --output .docker-build/ferramentas
RUN retype build retype-ferramentas-legado.yml --output .docker-build/ferramentas-legado
RUN retype build retype-processo-trainee.yml --output .docker-build/processo-trainee

FROM httpd:latest
COPY --from=builder /build/.docker-build/ /usr/local/apache2/htdocs/

VOLUME /usr/local/apache2/htdocs/imagens-docstruct
RUN rm /usr/local/apache2/htdocs/index.html
COPY ./index.html /usr/local/apache2/htdocs/