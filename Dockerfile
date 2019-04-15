FROM python:3.4

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask uWSGI requests redis==3.0.1
WORKDIR /app
COPY app /app
COPY cmd.sh /
RUN chmod +x /cmd.sh

EXPOSE 9090 9191
USER uwsgi
CMD ["/cmd.sh"]
