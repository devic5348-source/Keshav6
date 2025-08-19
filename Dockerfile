# Use a supported Python base image
FROM python:3.10.8-slim-bullseye

# Install git and other dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git

# Copy and install Python dependencies
COPY requirements.txt /requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install -r /requirements.txt

# Create app directory
RUN mkdir /VJ-FILTER-BOT
WORKDIR /VJ-FILTER-BOT

# Copy the rest of your bot code
COPY . /VJ-FILTER-BOT

# Run the bot
CMD ["python3", "bot.py"]
