# base image
# ---------------
FROM jekyll/jekyll

# Maintainer
# ----------
MAINTAINER Tomáš Horák <tomashorak@post.cz>

# Environment variables
# -------------------------------------------------------------
ENV BUNDLE_GEMFILE=/opt/Gemfile

# Install scripts
# --------------------
COPY Gemfile /opt

# install dependecies
RUN bundle update

CMD jekyll serve --watch --drafts --force_polling -t
