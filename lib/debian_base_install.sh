#!/bin/bash
set -e

apt update && apt -y upgrade && \
  apt -y install tar && \
  apt -y install mc && \
  apt -y install git && \
  apt -y install wget && \
  apt -y install gnupg 

  
