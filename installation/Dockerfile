# ref https://github.com/tebeka/pythonwise/blob/master/docker-miniconda/Dockerfile
FROM ubuntu:18.04

WORKDIR /home/
# System packages 
RUN apt-get update && apt-get install -y curl git

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -qq update && apt-get -qq install -y curl vim less unzip

# Install miniconda to /miniconda
WORKDIR /app/

COPY 01-install-conda.sh .
RUN ./01-install-conda.sh

ENV PATH=/root/miniconda/bin:${PATH}
RUN conda update -y conda


COPY 02-create-env.sh environment.yml .
RUN ./02-create-env.sh

run touch break.cache.1

RUN conda init bash
RUN echo "conda activate viral" >> ~/.bashrc

COPY 03-post-conda-step.sh .

RUN ./03-post-conda-step.sh 

WORKDIR /app/jvarkit
RUN ["conda", "run", "-n", "viral", "--no-capture-output", "./gradlew", "msa2vcf"]

WORKDIR /app/reference

RUN ["conda", "run", "-n", "viral", "--no-capture-output", "bwa", "index", "NC_045512.2_covid19.fa"] 

WORKDIR /app/scripts

COPY scripts/*  .

ENTRYPOINT ["conda", "run", "-n", "viral", "--no-capture-output", "/app/scripts/fasta_to_vcf.pipeline.sh"]

CMD ["--help"]

WORKDIR /app/installation
COPY Dockerfile .

WORKDIR /app
