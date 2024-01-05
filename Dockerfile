FROM python:3.11.6-alpine3.18

WORKDIR /app
COPY requirements.txt .
COPY app.py .
COPY templates templates/
COPY static static/

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

ENTRYPOINT [ "flask", "run", "--host=0.0.0.0" ]
