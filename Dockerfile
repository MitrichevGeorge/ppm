FROM eclipse-temurin:17-jre-alpine

WORKDIR /minecraft

# Используем более новую версию Paper для оптимизации
RUN wget -O paper.jar https://api.papermc.io/v2/projects/paper/versions/1.20.1/builds/196/downloads/paper-1.20.1-196.jar

COPY eula.txt ./

EXPOSE 25565

# Минимальные настройки памяти
CMD ["java", "-Xmx384M", "-Xms128M", "-jar", "paper.jar", "nogui"]
