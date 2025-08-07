FROM python:3.9

# Install system dependencies needed for mysqlclient
RUN apt-get update && apt-get install -y \
    libmysqlclient-dev \
    default-libmysqlclient-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy all source code
COPY . .

# Expose port
EXPOSE 8000

# Start the Django app
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
