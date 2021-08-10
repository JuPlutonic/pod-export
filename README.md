# README

## Перечень организаций — поставщиков датасетов

Получаем данные о ПОД из <https://data.gov.ru>

![Heroku](https://pyheroku-badge.herokuapp.com/?app=pod-export7657651&style=plastic)
[::обитает![обитает здесь](https://s3.amazonaws.com/assets.heroku.com/addons.heroku.com/uploaded_logos/13555/icon.png)здесь::](https://pod-export7657651.herokuapp.com/)

## Config

* Ruby версия (вставьте данную строку в Gemfile): `ruby '~> 2.6.0'`

* Rails 5.2.6

* Front-end часть — простая, ассеты компилятся так:

  > Рекомендую ноду        ` $(which -a node | head -n 1) -v # => v12.22.4`
  > Ярн первой версии      ` npm install -g yarn@1.22.5`
  > Установим его в рельсы `rails yarn:install`
  > Скомпилим ассеты       `rails assets:precompile`

* heroku — в .gitignore добавлен файл config`/initializers/oink.rb`

* Анализ логов Oink:

  > `bundle exec oink --format verbose -t 60 ./log/*`

* Запуск в tmux:

  > Запустим Overmind, затем запустим Tmuxinator
  > (оба приложения ставятся отдельно):
  > `overmind s 2>&1 >/dev/null &`
  > `mux start pod-export`
  > Tmuxinator (mux — это «алиас»), подключивщись по сокету, откроет окно
  > Overmind-а с «рельсой», если не открываются окна-табы тмукса, сделать так:
  > `tmux kill-session -t pod-export; mux start -p=./.tmuxinator.yml`

## Особенности

* Без скаффолдинга, т.к. данные получаются (скрапятся) по ходу работы. Генерил
    модели, а также контроллеры без маршрута.

* Поэтому в методе индекс и в application_helper происходит сравнения
    персистанса из БД с соскраппленными таблицами и поэтому submit из
    специальной формы gem ('simple_form').

* Pod - ПОД (поставщик открытых данных) и ИНН в приложении синонимы, также
    tax_payer_id в приложении стал primary_key типа «string», во избежание
    ошибок как на стороне postgres, так и для того, чтобы ошибочный скраппинг не
    влиял на работу приложения.

## AGILE

app/views/pods/index.html.slim (убрал из кода):

* `[ 15] [TODO]` Пользователь не только выбирает страницу, но и фильтрует по
    названию организации. Дополнительное поле в simple form.

app/views/shared/_navbar.html.slim (убрал из кода):

* `[14-] [OPTIMIZE]` Пользователь не видит текущее своё положение в приложении.
    Не скрывается ссылка на иднекс в индексе.

* `[-15-] [OPTIMIZE]` __Речь о NAVBAR-е… Н/р link_to_unless_current почему-то, да
    и у тега link класс - active.

* `[-16]` / = link_to_unless_current "🏡", {action: "index" }

app/views/shared/_pods_table.html.slim (убрал из кода):

* `[17] [TODO]` ТEST на-первую 'true' часть IF условия.

app/controllers/page_navs_controller.rb:

* `[19-] [OPTIMIZE]` Something wrong with with 'ActionController::Parameters',
    what is 'permitted: false'

* `[-20] [OPTIMIZE]` __and can be accessed only by `params[:page_nav][:page]`
    hash key.

app/controllers/pods_controller.rb:

**BRANCH:** pods_new_organization-description

* `[27] [TODO]` User sees Pod's open datasets, pod_params have data_attributes:
    `[:id, :date, :source, :author, :converted]`

app/models/datum.rb:

* `[18] [TODO]` User must see data, sorted (ASC) by date. Now, by default
    it's sorted (DESC) by updated_at.

app/models/page_nav.rb:

* `[7] [TODO]` UA round-robin and resending of time-outed query

* `[79] [TODO]` User may filter page results. Filter '' needs to be passed by
    default.

* `[86] [TODO]` TEST crawling when base_url have only one page (where is no
    pagination on the target site).

* `[104-] [FIXME]` Glitches: P8 /administraciya-kostromskoy-oblasti, P3
    /administraciya-vladimirskoy-oblasti

* `[-105] [FIXME]` __Appearing only if the type of the organizations is "
    regional".

---

