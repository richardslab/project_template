FROM ubuntu:18.04
ARG ENVIRONMENT=project_name

WORKDIR /home/
# System packages 
RUN apt-get update && apt-get install -y curl git vim less unzip

WORKDIR /app/

COPY 01-install-conda.sh .
RUN ./01-install-conda.sh

ENV PATH=/root/miniconda/bin:${PATH}

COPY 02-create-env.sh environment.yml .
RUN ./02-create-env.sh ${ENVIRONMENT}

# RUN conda init bash

COPY 03-post-conda-step.sh .
RUN ./03-post-conda-step.sh ${ENVIRONMENT}

WORKDIR /app

COPY scripts/entrypoint.sh  .
RUN chmod a+x ./entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

CMD ["echo Hello project_template user."]

WORKDIR /app/installation
COPY Dockerfile .

WORKDIR /app
