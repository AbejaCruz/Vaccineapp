FROM ruby:2.3.1

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get update -y
RUN apt-get install -y nodejs
RUN mkdir /Vaccineapp
WORKDIR /Vaccineapp
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN apt-get install -y postgresql-client-9.4

COPY ./start-bundle-exec.sh /Vaccineapp/
ENTRYPOINT ["./start-bundle-exec.sh"]

RUN mkdir /Vaccineapp/src
WORKDIR /Vaccineapp/src
