#!/bin/bash
export AIRFLOW_HOME="/workspaces/hands-on-introduction-data-engineering-4395021/airflow"

AIRFLOW_VERSION=2.5.1
PYTHON_VERSION="$(python --version | cut -d " " -f 2 | cut -d "." -f 1-2)"
echo "Installing Airflow Version $AIRFLOW_VERSION, with Python $PYTHON_VERSION"
CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"
pip install "apache-airflow==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"


airflow users create \
  --username manvith \
  --firstname manvith \
  --lastname katkuri \
  --role Admin \
  --email manvithkatkuri000@gmail.com \
  --password mAnvith@000

airflow webserver -D
airflow scheduler -D
