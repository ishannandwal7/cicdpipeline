CREATE TABLE deployments (
deployment_id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL,
schedule_time TIMESTAMPTZ,
event_based BOOLEAN,
trigger VARCHAR(255) NOT NULL,
branch VARCHAR(255) NOT NULL DEFAULT 'master'
);
CREATE TABLE tasks (
    task_id SERIAL PRIMARY KEY,
    deployment_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    task_order INT NOT NULL,
    FOREIGN KEY (deployment_id) REFERENCES deployments(deployment_id)
);


CREATE TABLE deployment_history (
history_id SERIAL PRIMARY KEY,
deployment_id INT NOT NULL,
timestamp TIMESTAMPTZ NOT NULL DEFAULT NOW(),
deployment_status VARCHAR(255) NOT NULL,
commit_id VARCHAR(255),
branch VARCHAR(255),
FOREIGN KEY (deployment_id) REFERENCES deployments(deployment_id)
);

CREATE TABLE queue (
queue_id SERIAL PRIMARY KEY,
deployment_id INT NOT NULL,
queue_order INT NOT NULL,
estimated_completion_time TIMESTAMPTZ,
FOREIGN KEY (deployment_id) REFERENCES deployments(deployment_id)
);