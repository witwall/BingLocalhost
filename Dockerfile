FROM python:3.10

WORKDIR /srv
COPY ./requirements.txt .

RUN python3 -m venv venv && . venv/bin/activate
RUN python3 -m pip install --no-cache-dir -r requirements.txt --upgrade pip

COPY ./main.py /srv/main.py
COPY ./static /srv/static
COPY ./utils.py /srv/utils.py

ENV PORT=8080
ENV COOKIES={}
EXPOSE ${PORT}

CMD ["python", "main.py"]
