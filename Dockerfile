FROM python:3.10

ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN pip install --upgrade pip "poetry=1.1.12"
RUN poetry config virtualenvs.create false --local
COPY pyproject.toml poetry.lock ./
RUN poetry install

COPY mysite .

CMD ["gunicon", "mysite.wsgi:application", "--bind", "0.0.0.0:8000"] 
