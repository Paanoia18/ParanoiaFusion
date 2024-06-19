#!/bin/bash

echo "Создание виртуальной среды"
python3.9 -m venv venv
source venv/bin/activate

echo "Установка pip вручную"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.9 get-pip.py

echo "Установка pip и обновление"
pip install --upgrade pip

echo "Установка зависимостей"
pip install -r requirements.txt

echo "Выполнение миграций"
python3.9 manage.py migrate

echo "Сборка статических файлов"
python3.9 manage.py collectstatic --noinput

echo "Скрипт завершен успешно"

