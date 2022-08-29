# README

## Перечень организаций — поставщиков датасетов

Получаем данные о ПОД из <https://data.gov.ru>

![](https://pyheroku-badge.herokuapp.com/?app=pod-export7657651&style=plastic) \
[::ОбитаетЗдесь::![обитает здесь](https://img.shields.io/badge/heroku-%23430098.svg?style=for-the-badge&logo=heroku&logoColor=white)](https://pod-export7657651.herokuapp.com/)

## Config

* Ruby версия (вставьте данную строку в Gemfile): `ruby '~> 3.1.0'`

* Rails 7.0.3.1, PostgreSQL (=< 14.4, рекомендую версию как в heroku: 11.16)

* heroku — в .gitignore добавлен файл config`/initializers/oink.rb`

* Анализ логов Oink:

  > `bundle exec oink --format verbose -t 60 ./log/*`

* Запуск в tmux:

  > Запустим Overmind, затем запустим Tmuxinator \
  > (оба приложения ставятся отдельно): \
  > `overmind s 2>&1 >/dev/null &` \
  > `mux start pod-export` \
  > Tmuxinator (mux — это «алиас»), подключивщись по сокету, откроет окно
  > Overmind-а с Puma/RoR, если не открываются окна-табы тмукса, сделать так: \
  > `tmux kill-session -t pod-export; mux start -p=./.tmuxinator.yml`

## Особенности

* Данные скрапятся по ходу работы. На сайте появился API, сделаю без скрапинга \
    _**в другом репозитории**_.

* `layouts/_flash.html.slim` убираются автоматически: \
    задействован Stimulus (removals_controller.js).

* Паршиал `shared/_pods_table.html.slim` обновляется с помощью TurboStream, \
    на индексе стоит TurboFrame, и связаны они с помощью dom_id.

* В `pods/index.html.slim` — submit из специальной формы gem `simple_form` \
    (самописный пейджер / пагинация), в паршале `_pods_table.html.slim` \
    происходят сравнения персистанса из БД с соскраппленными таблицами \
    (метод `elem_retrieval`).

* Наименования:  Pod — ПОД (поставщик открытых данных) связан с ИНН \
    (`tax_payer_id`, реализована валидация) из таблицы `budget_participants`.

---

