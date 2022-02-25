FROM jupyter/base-notebook

LABEL Guilherme Masuko <guilhermemasuko@gmail.com>

# Let's change to root user to install java 8
USER root

# Install java 8
RUN apt-get update \
    && echo "Updated apt-get" \
    && apt-get install -y openjdk-8-jre \
    && echo "Installed openjdk 8"
    
# Install kotlin kernel for jupyter using conda
RUN conda install -y -c jetbrains kotlin-jupyter-kernel && echo "Kotlin Jupyter kernel installed via conda"

RUN pip install pandas \
                numpy \
                Jinja2 \
                requests \
                bs4 \
                scipy

EXPOSE 8888

ENTRYPOINT [ "jupyter", "notebook", "--ip=0.0.0.0", "--allow-root" ]

#Let's define this parameter to install jupyter lab instead of the default juyter notebook command so we don't have to use it when running the container with the option -e
ENV JUPYTER_ENABLE_LAB=yes