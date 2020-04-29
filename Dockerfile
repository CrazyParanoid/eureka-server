FROM openjdk:8-jdk-alpine

COPY target/eureka-server-1.0.jar /opt/eureka-server/

# setting proper TZ
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

EXPOSE 8080
VOLUME /opt/eureka-server/logs

WORKDIR /opt/eureka-server/

CMD ["java","-jar","eureka-server-1.0.jar"]