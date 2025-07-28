FROM python:3.10.8-slim-buster

ENV DEBIAN_FRONTEND=noninteractive

# 🔁 Change source to archived buster repo
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y git gcc && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /VJ-Forward-Bot

# Install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy all files
COPY . .

# Start the bot
CMD ["python3", "main.py"]