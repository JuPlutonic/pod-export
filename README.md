# README

## перечень организаций, поставщиков датасетов

Получаем данные о ПОД из data.gov.ru

[![pod_export7657651](https://s3.amazonaws.com/assets.heroku.com/addons.heroku.com/uploaded_logos/13555/icon.png)](https://pod_export7657651.herokuapp.com/)

![Heroku](https://heroku-badge.herokuapp.com/?app=pod_export7657651) - здесь оно обитает.

## Config:

---

* Ruby version (put this line in Gemfile): ruby '2.4.9'

* Rails 5.2.3

* heroku config:set BLAH_BLAH_KEY="..........."

---

##### анализ логов oink:

bundle exec oink --format verbose -t 60 ./log/*

### особенности:

---

* Без скаффолдинга, т.к. данные получаются (скрапятся) по ходу работы. Генерил модели, а также контроллеры без маршрута. 

* Поэтому в методе индекс и в application_helper происходит сравнения персистанса из БД с соскраппленными таблицами и поэтому submit из специальной формы gem ('simple_form').

* Pod - ПОД (поставщик открытых данных) и ИНН в приложении синонимы, также tax_payer_id в приложении стал primary_key типа string, во избежание ошибок как на стороне postgres так и того чтобы ошибочный скраппинг не влиял на работу приложения. 

### AGILE:

app/views/pods/index.html.slim:

* [ 15] [TODO] Пользователь не только выбирает страницу, но и фильтрует по названию организации. Дополнительное поле в simple form.

app/views/shared/_navbar.html.slim:

* [14-] [OPTIMIZE] Пользователь не видит текущее своё положение в приложении. Не скрывается ссылка на иднекс в индексе.
* [-15] [OPTIMIZE] __Речь о NAVBAR-е… Н/р link_to_unless_current почему-то, да и у тега link класс - active.

app/views/shared/_pods_table.html.slim:

* [ 17] [TODO] ТEST на-первую 'true' часть IF условия.

app/controllers/page_navs_controller.rb:

* [19-] [OPTIMIZE] Something wrong with with 'ActionController::Parameters', what is 'permitted: false'
* [-20] [OPTIMIZE] __and can be accessed only by 'params[:page_nav][:page]' hash key.

app/controllers/pods_controller.rb:

* [27-] [TODO] User, when visits Pod's sees organization description and it's open datasets.
* [-28] [TODO] __NOKOGIRI, SIDEKIQ, REDIS, TAB tags and method @page_nav.scrape_data(@pod OR @tax_payer_id) implementation.

app/models/datum.rb:

* [ 18] [TODO] User must see data, sorted (ASC) by date. Now, by default it's sorted (DESC) by updated_at.

app/models/page_nav.rb:

* [ 79] [TODO] User may filter page results. Filter '' needs to be passed by default.
* [ 86] [TODO] TEST crawling when base_url have only one page (where is no pagination on the target site).
* [104-] [FIXME] Glitches: P8 /administraciya-kostromskoy-oblasti, P3 /administraciya-vladimirskoy-oblasti
* [-105] [FIXME] __Appearing only if the type of the organizations is "regional".

---
