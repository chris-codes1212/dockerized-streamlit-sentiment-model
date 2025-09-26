# Select base python image
FROM python:3.11-slim

# set working directory inside container
WORKDIR /app

# copy the requirements.txt file into the container
COPY requirements.txt .

# Intall the Python dependencies
RUN pip install -r requirements.txt

# Copy the application code into the container
COPY app.py .

# Copy the model pipeline into the container
COPY sentiment_model.pkl .

# Expose the port that Streamlit runs on (default is 8501)
EXPOSE 8501

# Define command to run the application when the container starts
CMD ["python3", "-m", "streamlit", "run", "app.py"]