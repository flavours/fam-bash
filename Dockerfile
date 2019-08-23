FROM alpine:3.9

ENV FAM_IDENTIFIER flavour/fam-bash

RUN apk add --no-cache bash

RUN mkdir -p /app

WORKDIR /app 

# install confest for policies check
RUN wget https://github.com/instrumenta/conftest/releases/download/v0.6.0/conftest_0.6.0_Linux_x86_64.tar.gz
RUN tar xzf conftest_0.6.0_Linux_x86_64.tar.gz
RUN mv conftest /usr/local/bin
RUN rm conftest_0.6.0_Linux_x86_64.tar.gz

# copy policies
RUN mkdir -p /flavour/fam-bash/policy
copy policy/*.rego /flavour/fam-bash/policy/

# copy the new stuff
COPY bin/add /bin/add
COPY bin/remove /bin/remove
COPY bin/check /bin/check
