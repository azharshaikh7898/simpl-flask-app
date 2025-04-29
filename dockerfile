# Use official Python base image
FROM python

# Set the working directory
WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Expose the port Flask will run on
EXPOSE 5000

# Set the command to run the app
CMD ["python", "app.py"]
