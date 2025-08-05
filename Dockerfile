FROM python:3.9

# Set working directory
WORKDIR /app/backend

# Copy only the requirements first
COPY requirements.txt ./

# Install system dependencies and Python packages
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir -r requirements.txt

# Copy the full project after installing dependencies
COPY . .

# Expose the port
EXPOSE 8000

# Run migration and then start server
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]

