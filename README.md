реализовать 3 запроса:

- POST /urls который возвращает короткий url

- GET /urls/:short_url который возвращает длинный URL и увеличивает счетчик запросов на 1

- GET /urls/:short_url/stats который возвращает количество переходов по URL


```
bundle install
RAILS_ENV=test bundle exec rake db:{create,migrate}
bundle exec rspec
```
