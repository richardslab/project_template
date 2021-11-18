# ref https://github.com/tebeka/pythonwise/blob/master/docker-miniconda/Dockerfile
FROM ubuntu:18.04
ENV ENVIRONMENT=project_name


WORKDIR /home/
# System packages 
RUN apt-get update && apt-get install -y curl git

#ENV TZ=America/New_York
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -qq update && apt-get -qq install -y vim less unzip

WORKDIR /app/

COPY 01-install-conda.sh .
RUN ./01-install-conda.sh

ENV PATH=/root/miniconda/bin:${PATH}
#RUN conda update -y conda

COPY 02-create-env.sh environment.yml .
RUN ./02-create-env.sh ${ENVIRONMENT}

RUN conda init bash
RUN echo "conda activate viral" >> ~/.bashrc

COPY 03-post-conda-step.sh .

RUN ./03-post-conda-step.sh ${ENVIRONMENT}

WORKDIR /app/scripts

COPY scripts/*  .

ENTRYPOINT ["conda", "run", "-n", "${ENVIRONMENT}", "--no-capture-output", "entrypoint.sh"]

CMD ["Whats up?"]

WORKDIR /app/installation
COPY Dockerfile .

WORKDIR /app
