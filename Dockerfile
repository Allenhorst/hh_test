FROM python:3.6

ENV FLASK_APP gentelella.py

COPY gentelella.py gunicorn.py requirements.txt config.py start.py .env ./
COPY app app
COPY server server
COPY migrations migrations

RUN pip install -r requirements.txt

EXPOSE 5000
CMD ["python /server/CreateDatabase.py"]
CMD ["gunicorn", "--config", "gunicorn.py", "gentelella:app"]