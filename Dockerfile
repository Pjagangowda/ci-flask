FROM  ubuntu:18.04
RUN apt-get update -y && apt-get upgrade -y && apt-get install git -y && apt-get install unzip -y
WORKDIR /opt
RUN apt install python3-pip -y
RUN  apt install python3-flask -y
RUN pip3 install mysql-connector-python
RUN  apt-get install mysql-server -y
RUN  apt-get install libmysqlclient-dev -y
RUN pip3 install flask-mysqldb
RUN git clone https://github.com/pjagannadha4/ci-flask.git
WORKDIR /opt/ci-flask
RUN mkdir templates
RUN mv main main.py
RUN mv index.html templates
RUN mv result.html templates
ENTRYPOINT [ "python3" ]

CMD [ "main.py" ]