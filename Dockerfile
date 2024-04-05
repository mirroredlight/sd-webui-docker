FROM python:3.10-slim

RUN apt update && \
    apt install -y \
    git google-perftools libgl1 \
;

WORKDIR /var/www
RUN useradd -ms /bin/bash -u 1500 worker
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
RUN chown -R worker /var/www

USER worker
WORKDIR /var/www/stable-diffusion-webui
#RUN ./webui.sh --exit --no-download-sd-model

ENV VENV_DIR=-

ENTRYPOINT [ "./webui.sh" ]
