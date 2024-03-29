---
draft: true
title: "Сам себе девопс: Drone CI"
description: "Разворачиваем проекты на сервере в один клик"
date: "2017-11-14T16:15:14+03:00"
comments: true
tags:
 - CI
---

Когда на личном сервере начинает появляться множество проектов (как рабочих, так и личных), пересборка любого проекта превращается в неудобный и долгий процесс. Даже если вы пользуетесь [Docker](https://www.docker.com), и у вас всё запаковано в контейнеры - для перезапуска сборки со свежими изменениями необходимо зайти на сервер и набрать:

```
$ git pull
$ docker-compose stop && docker-compose up -d --build
```

К счастью, на самом деле это не проблема. Для автоматической сборки, тестирования и деплоя проектов разработано множество систем - от [Jenkins](https://jenkins.io) и [CircleCI](https://circleci.com) до [Travis CI](http://travis-ci.org) и [Gitlab](https://gitlab.com). Я же хочу рассказать про Drone CI - еще одну такую систему, которая:

 - может размещаться на вашем сервере (в отличии от CircleCI и Travis CI)
 - полностью бесплатная и вообще опенсорс (в отличии от Gitlab CI)
 - написана на Go и занимает всего 2 мегабайта в оперативной памяти (в отличии от Gitlab CI и Jenkins)
 - конфигурируется одним файлом
 - интегрирована с Docker и собирает все в Docker-контейнерах
 - имеет плагины на все случаи жизни

Из недостатков можно назвать отсутствие встроенного кэширования и очень скудную документацию. Даже [туториалы](http://readme.drone.io/tutorials/) рождают больше вопросов, чем ответов. Поэтому мы рассмотрим настройку с самого нуля - а кэшированию и тонкому конфигурированию будет посвящена уже другая статья.

## Установка

