FROM alpine/git:latest AS clone
WORKDIR /app1
RUN git clone https://github.com/tbuttier/spring-petclinic.git 

FROM maven:alpine AS build
WORKDIR /app2
COPY --from=clone /app1/spring-petclinic . 
RUN mvnw spring-boot:run

#FROM openjdk:jre-alpine AS production
#WORKDIR /app3
#COPY --from=build /app2/target/spring-petclinic.jar .
#ENTRYPOINT ["java","-jar"]
#CMD ["spring-petclinic.jar"]

# COMMENT
