#!/bin/bash
# Начало скрипта

# Вывод приветственного сообщения
echo "****************************************"
echo " Setting up Capstone Environment"
echo "****************************************"

# Создание новой виртуальной среды с использованием Python 3.9
echo "Creating a new Anaconda environment with Python 3.9"
conda create -n capstone_env python=3.9

# Настройка среды разработки
echo "Configuring the developer environment..."
# Добавляет комментарий в файл .bashrc, указывая, что следующие строки относятся к проекту DevOps Capstone.
echo "# DevOps Capstone Project additions" >> ~/.bashrc
#Добавляет переменную среды GITHUB_ACCOUNT в файл .bashrc. Эта переменная будет 
#доступна в терминале и может быть использована для автоматического ввода имени пользователя GitHub.
echo "export GITHUB_ACCOUNT=$GITHUB_ACCOUNT" >> ~/.bashrc
#Изменяет приглашение командной строки (PS1), добавляя цвета и другие элементы для улучшения читаемости.
echo 'export PS1="\[\e]0;\u:\W\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "' >> ~/.bashrc
# Активирует виртуальную среду Python при каждом открытии нового терминала. Вместо ручной активации
# среды с помощью source ~/venv/bin/activate, эта команда автоматически активирует среду при старте терминала.
echo "conda activate capstone_env" >> ~/.bashrc

# Активация новой виртуальной среды
echo "Activating the new Anaconda environment"
source activate capstone_env

# Установка зависимостей Python из файла requirements.txt
echo "Installing Python dependencies..."
pip install --upgrade pip wheel
pip install -r requirements.txt

# Вывод сообщения об успешном завершении настройки
echo "****************************************"
echo " Capstone Environment Setup Complete"
echo "****************************************"
echo ""
echo "Use 'conda deactivate' to exit the Anaconda environment"
echo ""

# Конец скрипта
