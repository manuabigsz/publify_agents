FROM python:3.11-slim

# Copia tudo para o diretório padrão (root)
COPY . .

# Instala dependências
RUN pip install --upgrade pip \
 && pip install -r requirements.txt \
 && pip install uvicorn fastapi crewai

# Expõe a porta da aplicação
EXPOSE 8000

# Comando de inicialização
CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8000"]
