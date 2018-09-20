
# CircleCI Docker Image for Ruby with Google Cloud

This is a layer on top of the default CircleCI Ruby image that includes Google
cloud `gcloud` utilities installed.

## Running Locally

If you want to modify the container or run it locally you can use the following
commands.

#### Build

```
docker build -t rhomel/ruby-gcloud:[OPTIONAL_TAG] .
```

Example:

```
docker build -t rhomel/ruby-gcloud:2.4.4-jessie .
```

#### Run

To open a shell in the container:

```
docker run -it rhomel/ruby-gcloud:2.4.4-jessie /bin/bash
```

You may omit the tag (`2.4.4-jessie`) to default to `latest`.

