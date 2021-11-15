FROM python:3.6.15-alpine

WORKDIR /app
COPY . /app

RUN apk --no-cache --update add build-base && \
    pip install -r /app/requirements.txt && \
    apk del build-base

ENV POST_DATABASE_HOST base_pst
ENV POST_DATABASE posts

ENTRYPOINT ["python3", "post_app.py"]
