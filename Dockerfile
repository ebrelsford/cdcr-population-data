FROM openjdk:slim
COPY --from=amazon/aws-cli:2.0.61 / /
COPY --from=python:3.8 / /

# set the working directory in the container
WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# copy the content of the local src directory to the working directory
COPY datacleaning datacleaning

CMD [ "./datacleaning/download_and_parse.sh" ] 
