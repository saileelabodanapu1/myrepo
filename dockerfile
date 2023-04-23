FROM maven  as build
WORKDIR /app
COPY  . . 
RUN  mvn clean install

FROM openjdk:11.0
WORKDIR /app  
COPY --from=build /app/target/anil.war /app/
EXPOSE 9090
CMD [ "java","-jar","anil.war" ]



