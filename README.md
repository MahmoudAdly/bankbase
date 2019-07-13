# bankbase

A code challenge to create a TransferWise example for multicurrency money transfer between users.

## State of the code

This code is not complete yet. At this moment, it can list user transactions, create a new transaction, and enqueue the transaction for processing.

## What's next

The list of what to do is long :) But here is an overview of what I wanted to do:
- Fix the delayed jobs setup in Docker. (WIP pull request: https://github.com/MahmoudAdly/bankbase/pull/6, merged to be included in the 'code audit')
- Update the dummy `TransactionProcessorJob` to actually validate the user's balance, do the transfer, and mark the transaction as `finished` or `failed`.
- Update `FetchExchangeRate` service to return real data.
- Add the "Total balance" section in the home page and calculate it based on the `finished` transactions.
- Check https://github.com/RailsEventStore/rails_event_store for the possibility of event-based balance calculation.
- Go through the TODO/FIXME sections in the code.
- Write unit tests using `rspec` gem.
- Install `rubocop` gem and attach it to pre-commit Git hooks.
- User `paper_trail` gem in the models.
- Move some hard-coded text in the view to translations.
- Revise the DB composite indexes for faster queries.

## How to run locally

Please use Docker for a consistent development experience.

For the first time, run the following commands:
```
$ cp .env.example .env
$ docker-compose build
$ docker-compose run --rm app bin/rails db:migrate
$ docker-compose run --rm app ./bin/setup
$ docker-compose up
```

Then later, run only:
```
$ docker-compose up
```

If you ever want to change the DB seeds and re-apply them, you can run:
```
$ docker-compose run --rm app bin/rake db:reset db:seed
```

To connect to a container (like the app's rails console):
```
$ docker exec -it bankbase_app_1 /bin/bash
$ rails c
```

If you have a problem like:
> app_1          | A server is already running. Check /usr/src/app/tmp/pids/server.pid.
>
> app_1          | Exiting

Run this command and start the Docker image again:
```
$ rm tmp/pids/server.pid
$ docker-compose up
```
