# 🗂️ Модуль 02: Базы данных и SQL
Посмотреть материалы модуля: [здесь](https://github.com/Data-Learn/data-engineering/blob/master/DE-101%20Modules/Module02/readme.md) 📑

Посмотреть задание: [здесь](https://github.com/Data-Learn/data-engineering/tree/master/DE-101%20Modules/Module02/DE%20-%20101%20Lab%202.1) 👀

✒️ Задачи:

+ установить базу данных к себе на компьютер / Postgres
+ установить клиент SQL для подключения базы данных / DBeaver
+ создать 3 таблицы и загрузить данные из excel-файла Superstore в базу данных
+ написать SQL-запросы, чтобы изучить показатели бизнеса
+ нарисовать модели данных для Superstore
+ выполнить DDL в SQL клиенте: создать новые таблицы и заполнить их данными
+ загрузить данные в разные слои: создать схемы stg и dw и наполнить их данными
+ создать дашборды в нескольких BI-инструментах
  
## Установка базы данных, клиента SQL, загрузка данных в БД, написание SQL-запросов

**Инструменты: Postgres, DBeaver**

Скрипт для загрузки таблицы orders: [здесь](https://github.com/FtrDtEngnr/DataLearn/blob/main/module2/orders_table_creating_script.sql)

Скрипт для загрузки таблицы people: [здесь](https://github.com/FtrDtEngnr/DataLearn/blob/main/module2/people_table_creating_script.sql)

Скрипт для загрузки таблицы returns: [здесь](https://github.com/FtrDtEngnr/DataLearn/blob/main/module2/returns_table_create_script%20.sql)

SQL-запросы: [здесь](https://github.com/FtrDtEngnr/DataLearn/blob/main/module2/analytic_queries_script.sql)

## Модели данных для Superstore
**Инструмент: SqlDBM**

+ этот open-source инструмент позволяет рисовать модели данных на разных уровнях детализации
+ здесь графически представлены макеты моделей - поэтому удобно настраивать взаимосвязи таблиц
+ а в разделе Forward engineering можно получить DDL для создания таблиц по созданным моделям
  
**Мини-презентация**: [здесь](https://github.com/FtrDtEngnr/DataLearn/blob/main/module2/Model_types.pdf)

### Концептуальная модель
На этом этапе продумывается концепция таблиц, им даются названия + определяются взаимосвязи

![conceptual model](https://github.com/FtrDtEngnr/DataLearn/blob/main/module2/conceptual_model%20.png)

### Логическая модель
На этом шаге концепция дополняется конкретными столбцами + определяются ключи

![logical model](https://github.com/FtrDtEngnr/DataLearn/blob/main/module2/logical_model.png)

### Физическая модель
Столбцы дополняются типами данных + отсюда можно брать DDL для создания таблиц в SQL-клиенте

![physical model](https://github.com/FtrDtEngnr/DataLearn/blob/main/module2/physical_model.png)


## DDL - Data Definition Language
В этом задании используется:

**DDL (Data Definition Language)** - это подмножество языка SQL (Structured Query Language), используемое для определения структуры базы данных и ее объектов, таких как таблицы, представления, индексы и процедуры.

Все скрипты для создания таблиц и наполнения их данными: [здесь](https://github.com/FtrDtEngnr/DataLearn/blob/main/module2/DDL_script.sql)

На основании физических моделей были созданы dimension-таблицы:

* calendar,
* geography,
* product,
* shipping,
  
и в конце создана таблица

* sales,
  
к которой идут все взаимосвязи.

Все таблицы наполнены данными благодаря SQL-запросам.

## Слои данных
Скрипты создания новых схем stg и dw и наполнения их данными:

* для схемы stg: [здесь](https://github.com/FtrDtEngnr/DataLearn/blob/main/module2/CreationOfStaggingDw.sql)
* для схемы dw: [здесь](https://github.com/FtrDtEngnr/DataLearn/blob/main/module2/CreationBuisnessDw.sql)

## Дашборд в BI tool
**Инструмет: AWS QuickSight**
В процессе обучения попробовав три разных инструмента:
* Google Looker Studio
* Klipfolio 
* AWS QuickSight

я выбрал именно последний по причине распространенности облаков от Amazon, широты функционала и интуитивно понятному интерфейсу.
![QuickSight Interface](https://github.com/FtrDtEngnr/DataLearn/blob/main/module2/process_of_creation_dashboard.png)

Для дашборда по уже знакомой нам базе superstore я выбрал следующие метрики:
* a
* a
* a

![Dashboard Quicksight](https://github.com/FtrDtEngnr/DataLearn/blob/main/module2/Dashboard_AWS_Quicksight_page-0001.jpg)
[Dashboard Quicksight](https://github.com/FtrDtEngnr/DataLearn/blob/main/module2/Dashboard_AWS_Quicksight.pdf)


