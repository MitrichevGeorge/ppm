#!/bin/bash
# Запускаем сервер в фоне
java -Xmx2G -Xms1G -jar paper.jar nogui &

# Сохраняем PID процесса
SERVER_PID=$!

# Ждем немного чтобы сервер начал запускаться
sleep 30

# Выводим логи в реальном времени
tail -f logs/latest.log

# Ждем завершения сервера
wait $SERVER_PID
