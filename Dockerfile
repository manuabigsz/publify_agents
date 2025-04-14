FROM python:3.11-slim

COPY . .

RUN pip install --upgrade pip \
 && pip install -r requirements.txt \
 && pip install uvicorn fastapi crewai

EXPOSE 8000

CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8000"]
