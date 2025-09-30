FROM openjdk:17-jdk-slim

WORKDIR /minecraft

RUN apt-get update && apt-get install -y curl

# Скачивание PaperMC
RUN curl -o paper.jar https://api.papermc.io/v2/projects/paper/versions/1.20.1/builds/196/downloads/paper-1.20.1-196.jar

# Копирование конфигов
COPY server.properties ./
COPY eula.txt ./

# Явно указываем порт для Render
EXPOSE 25565

# Используем переменную окружения для порта
CMD ["java", "-Xmx2G", "-Xms1G", "-jar", "paper.jar", "--port", "25565", "nogui"]
