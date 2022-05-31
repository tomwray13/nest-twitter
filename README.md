# Nest Twitter

Simple Twitter clone build in Nest + Postgres with Docker for local development

## Installation

Install dependencies:

```bash
$ npm install
```

Copy the `.env.example` into an `.env` file and update the credentials accordingly, ensuring it matches up to the `docker-compose.yml`

## Running the app locally

First open up the containers for the nest app and Postgres database using the docker compose file:

```bash
$ docker-compose up -d
```

Then open up the CLI against the Nest project and run local migrations. You can open up the CLI in VSCode's Docker extension by right clicking with 'Attach shell':

```bash
$ npx prisma migrate dev
```

## Deployment

TBC