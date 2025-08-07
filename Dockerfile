# Step 1: Use Python 3.9 as the base image
FROM python:3.9

# Step 2: Set working directory
WORKDIR /app/backend

# Step 3: Copy requirements file
COPY requirements.txt /app/backend

# Step 4: Install Python dependencies
RUN pip install -r requirements.txt

# Step 5: Copy the rest of the application code
COPY . /app/backend

# Step 6: Expose the port Django will run on
EXPOSE 8000

# Step 7: Run the Django development server
CMD ["python", "/app/backend/manage.py", "runserver", "0.0.0.0:8000"]

