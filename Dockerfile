FROM continuumio/miniconda3

RUN apt-get update

RUN mkdir work
WORKDIR work

COPY environment.yml requirements.txt ./
RUN conda env create -f environment.yml

RUN echo "conda activate fastimg" >> ~/.bashrc

ENV PATH /opt/conda/envs/fastimg/bin:$PATH
ENV CONDA_DEFAULT_ENV fastimg

RUN pip3 install ipykernel
RUN python -m ipykernel install --user --name=fastimg

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
