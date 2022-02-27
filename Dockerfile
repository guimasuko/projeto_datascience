FROM jupyter/base-notebook

LABEL Guilherme Masuko <guilhermemasuko@gmail.com>

USER root

RUN apt-get update \
    && echo "Updated apt-get" \
    && apt-get install -y openjdk-8-jre \
    && echo "Installed openjdk 8"
    

RUN conda install -y -c jetbrains kotlin-jupyter-kernel && echo "Kotlin Jupyter kernel installed via conda"

RUN pip install pandas \
                numpy \
                Jinja2 \
                requests \
                bs4 \
                scipy

EXPOSE 8888

ENTRYPOINT [ "jupyter", "notebook", "--ip=0.0.0.0", "--allow-root" ]


ENV JUPYTER_ENABLE_LAB=yes

# CMD jupyter lab --ip='0.0.0.0' --port=8888 --no-browser --allow-root


