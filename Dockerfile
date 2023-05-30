FROM openjdk:11
WORKDIR /app
COPY . .
RUN apt update 
RUN apt upgrade -y 
RUN apt install maven -y 

