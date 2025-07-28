FROM python:3.10.8-slim-bookworm

Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y && apt install -y git

COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

COPY . /app
WORKDIR /app

CMD ["python", "bot.py"]