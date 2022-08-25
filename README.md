# README

## Перечень организаций — поставщиков датасетов

Получаем данные о ПОД из <https://data.gov.ru>

![](https://pyheroku-badge.herokuapp.com/?app=pod-export7657651&style=plastic) \
[::ОбитаетЗдесь::![обитает здесь](https://img.shields.io/badge/heroku-%23430098.svg?style=for-the-badge&logo=heroku&logoColor=white)](https://pod-export7657651.herokuapp.com/)

## Config

* Ruby версия (вставьте данную строку в Gemfile): `ruby '~> 3.1.0'`

* Rails 7.0.3.1, PostgreSQL (=< 14.4, рекомендую версию как в heroku: 11.16)

* Front-end часть — простая:

  > Рекомендую ноду        `$(which -a node | head -n 1) -v # => v16.13.1`\
  > Ярн первой версии      `npm install -g yarn@1.22.17`\
  > Установим его в рельсы `rails yarn:install`\

* heroku — в .gitignore добавлен файл config`/initializers/oink.rb`

* Анализ логов Oink:

  > `bundle exec oink --format verbose -t 60 ./log/*`

* Запуск в tmux:

  > Запустим Overmind, затем запустим Tmuxinator \
  > (оба приложения ставятся отдельно): \
  > `overmind s 2>&1 >/dev/null &` \
  > `mux start pod-export` \
  > Tmuxinator (mux — это «алиас»), подключивщись по сокету, откроет окно
  > Overmind-а с «рельсой», если не открываются окна-табы тмукса, сделать так: \
  > `tmux kill-session -t pod-export; mux start -p=./.tmuxinator.yml`

## Особенности

* Данные получаются (скрапятся) по ходу работы.

* В `pods/index.html.slim` — submit из специальной формы gem `simple_form`, в \
    паршале `_pods_table.html.slim` происходит сравнения персистанса из БД с \
    соскраппленными таблицами.

* Наименования:  Pod — ПОД (поставщик открытых данных) связан с ИНН \
    (tax_payer_id) из таблицы budget_participants.

## AGILE

app/views/pods/index.html.slim (убрал из кода):

* `[ 15] [TODO]` Пользователь не только выбирает страницу, но и фильтрует по
    названию организации. Дополнительное поле в simple form.

app/views/shared/_navbar.html.slim (убрал из кода):

* `[14-] [OPTIMIZE]` Пользователь не видит текущее своё положение в приложении.
    Не скрывается ссылка на индекс в индексе.

* `[-15-] [OPTIMIZE]` Речь о NAVBAR-е… Н/р link_to_unless_current почему-то, да
    и у тега link класс `.active`.

* `[-16]` / = link_to_unless_current "🏡", {action: "index" }

app/views/shared/_pods_table.html.slim (убрал из кода):

* `[17] [TODO]` ТEST на-первую 'true' часть IF условия.

app/controllers/page_navs_controller.rb:

* `[19-] [OPTIMIZE]` Something wrong with with 'ActionController::Parameters',
    what is 'permitted: false'

* `[-20] [OPTIMIZE]` and can be accessed only by `params[:page_nav][:page]`
    hash key.

app/controllers/pods_controller.rb:

**BRANCH:** pods_new_organization-description_cp

* `[27] [TODO]` User sees Pod's open datasets, pod_params have data_attributes:
    `[:date, :source, :author, :converted]`

app/models/datum.rb:

**BRANCH:** pods_new_organization-description_cp

* `[88-] [TODO]` Open 2 times the same pod's page - it not converted. It shows
    cached tab. `Memoize :scrape_data`

* `[-89] [TODO]` _ for only 1st dataset's tab.

app/models/page_nav.rb:

* `[7] [TODO]` UA round-robin and resending of time-outed query

* `[79] [TODO]` User may filter page results. Filter '' needs to be passed by
    default.

* `[86] [TODO]` TEST crawling when base_url have only one page (where is no
    pagination on the target site).

* `[104-] [FIXME]` Glitches: P8 /administraciya-kostromskoy-oblasti, P3
    /administraciya-vladimirskoy-oblasti

* `[-105] [FIXME]` Appearing only if the type of the organization is "
    regional".

---

