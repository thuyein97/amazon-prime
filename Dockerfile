FROM eclipse-temurin:17-jdk-alpine
    
EXPOSE 8080
ENV APP_HOME=/usr/src/app

RUN addgroup -S app && adduser -S app -G app && \
    mkdir -p "$APP_HOME" && \
    chown -R app:app "$APP_HOME"

COPY app/*.jar $APP_HOME/app.jar

WORKDIR $APP_HOME

USER app

CMD ["java", "-jar", "app.jar"]
