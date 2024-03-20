# 🗂️ Модуль 01: Роль аналитики в организации
Посмотреть материалы модуля: [здесь](https://github.com/Data-Learn/data-engineering/tree/master/DE-101%20Modules/Module01)📑

Посмотреть задание: здесь 👀

✒️ Задачи:

+ оформление GitHub
+ архитектура аналитического решения
+ аналитика и дашборд в Excel

## Архитектура аналитического решения

**Инструмент: draw.io**

+ Source Layer

> This layer is responsible for connecting to the data sources. It works with raw data from various sources like source databases, CRM systems, and Google Analytics API.

 + Storage Layer

> This layer is responsible for storing data for processing and long-term use. It's proposed to use ELT processes and store data in Data Lake. It will help to speed up the data storing process and allow us to analyze data more deeply.

+ Business Layer

> The Business layer consists of Excel workflow, Tableau dashboards, and working with SQL queries.

<div style="text-align:center;">
    <img src="https://raw.githubusercontent.com/FtrDtEngnr/DataLearn/main/module1/ArchitectureOfSolution.png" width="600" height="400" style="margin: auto;">
</div>


Решение основано на процессе разработки бота автопродаж, которого я проектировал в 2023 году. Именно работа с этим ботом вдохновила меня на начало обучения Data Engineering. 


## Аналитика и дашборд в Excel
**Инструмент: Excel**
Для создания дашборда я выбрал основные метрики, отражающие следующее:
+ Динамика продаж и дохода
+ Топ-5 клиентов по принесенному доходу
+ Продажи по категориям на каждый месяц 2019
+ Распределение новых клиентов за май 2019
+ Продажи по сегментам на каждый месяц 2019

![excel dashboard](https://github.com/FtrDtEngnr/DataLearn/blob/main/module1/excel_dashboard.png)
