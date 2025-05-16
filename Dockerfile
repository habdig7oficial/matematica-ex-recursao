FROM erlang:latest

WORKDIR /mnt

COPY . .

RUN erlc ex.erl 

CMD ["erl", "-noshell", "-run", "ex", "run_all", "-run", "init", "stop"]

#CMD ["bash"]