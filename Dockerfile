FROM python:3.10.8-slim-buster

# Use non-interactive frontend for apt
ENV DEBIAN_FRONTEND=noninteractive

# Update system and install dependencies
RUN apt-get update && \
    apt-get install -y git gcc && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /VJ-Forward-Bot

# Copy requirements and install
COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy rest of the project
COPY . .

# Start the bot
CMD ["python3", "main.py"]