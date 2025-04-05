# Imagem base
FROM python:3.11-slim

# Setar diretório de trabalho
WORKDIR /app

# Copiar arquivos do projeto
COPY . .

# Instalar Poetry
RUN pip install poetry

# Instalar dependências do projeto com Poetry
RUN poetry config virtualenvs.create false \
 && poetry install --no-root

# Instalar uvicorn diretamente (caso Poetry falhe)
RUN pip install uvicorn
RUN pip install fastapi

# Expor a porta usada pela FastAPI
EXPOSE 8000

# Comando para rodar o servidor
CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8000"]
