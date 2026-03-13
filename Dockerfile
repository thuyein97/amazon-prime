FROM eclipse-temurin:17-jdk-alpine

EXPOSE 8080
ENV APP_HOME=/usr/src/app

RUN addgroup -S -g 1000 app && adduser -S -u 1000 -G app app && \
    mkdir -p "$APP_HOME" && \
    chown -R 1000:1000 "$APP_HOME"

COPY app/*.jar $APP_HOME/app.jar

WORKDIR $APP_HOME

USER 1000

CMD ["java", "-jar", "app.jar"]
