FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7

COPY ./app /app


WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

CMD gunicorn -w 3 -k uvicorn.workers.UvicornWorker main:app --bind 0.0.0.0:$PORT