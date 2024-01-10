from datetime import datetime
from airflow.operators.bash import BashOperator
from airflow import DAG

default_args = {
    'owner': 'Manvith',
    'depends_on_past':'False',
    'email_on_failure' : False,
    'email_on_retry' : False,
    'retries' : 0,
    'catch_up' : False,
    'start_date' : datetime(2023, 12, 2)


}


with DAG(
    dag_id = 'one_task_dag',
    description = 'A one task airflow DAG',
    schedule_intervel = None,
    default_args = default_args

)as dag:
    
    task1=BashOperator(
        task_id='one_task',
        bash_command = 'echo"Thanks Linkedin Learning!" >/workshops/hands-on-introduction-data-engineering-4395021/lab',
        dag=dag
    )
