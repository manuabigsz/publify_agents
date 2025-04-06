FROM python:3.11-slim

WORKDIR /app

COPY . .

RUN pip install --upgrade pip \
 && pip install -r requirements.txt \
 && pip install uvicorn \ 
 && pip install fastapi \
 && pip install crewai

RUN which uvicorn  # debug opcional

EXPOSE 8000

CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8000"]
