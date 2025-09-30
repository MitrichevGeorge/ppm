FROM openjdk:17-jdk-slim

WORKDIR /minecraft

# Установка curl вместо wget (более стабильный в образах Alpine)
RUN apt-get update && apt-get install -y curl

# Скачивание PaperMC (замените версию на актуальную)
RUN curl -o paper.jar https://api.papermc.io/v2/projects/paper/versions/1.20.1/builds/196/downloads/paper-1.20.1-196.jar

# Копирование конфигов
COPY server.properties ./
COPY eula.txt ./

EXPOSE 25565

CMD ["java", "-Xmx2G", "-Xms1G", "-jar", "paper.jar", "nogui"]
