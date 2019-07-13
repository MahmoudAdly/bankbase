# bankbase

## How to run locally

Please use Docker for an easy development experience.

For the first time, run the following commands:
```
docker-compose build
docker-compose run --rm app bin/rails db:migrate
docker-compose run --rm app ./bin/setup
docker-compose up
```

Then later, run only:
```
docker-compose up
```
