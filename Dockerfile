FROM python:3.9

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libmysqlclient-dev \
    default-libmysqlclient-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy requirements and install
COPY backend/requirements.txt .
RUN pip install -r requirements.txt

# Copy rest of the app
COPY . .

# Run the Django server
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
