FROM ericdill/debian-conda-builder:latest

MAINTAINER Eric Dill <edill@bnl.gov>

# Create the `builder` user
USER builder
RUN conda install sphinx ipython jsonschema matplotlib && \
    pip install sphinxcontrib-napoleon

CMD ["make", "html", "-C", "/docs"]
