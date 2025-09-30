FROM openjdk:17-jdk-slim

WORKDIR /minecraft

RUN apt-get update && apt-get install -y curl

RUN curl -o paper.jar https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/445/downloads/paper-1.20.4-445.jar

COPY server.properties ./
COPY eula.txt ./
COPY start.sh ./

RUN chmod +x start.sh

EXPOSE 25565

CMD ["./start.sh"]
