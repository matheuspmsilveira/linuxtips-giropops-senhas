FROM cgr.dev/chainguard/python:latest-dev as builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user -r requirements.txt

FROM cgr.dev/chainguard/python:latest
WORKDIR /app
COPY --from=builder /home/nonroot/.local/lib/python3.11/site-packages /home/nonroot/.local/lib/python3.11/site-packages
COPY app.py .
COPY templates templates/
COPY static static/

EXPOSE 5000

ENTRYPOINT [ "flask", "run", "--host=0.0.0.0" ]
