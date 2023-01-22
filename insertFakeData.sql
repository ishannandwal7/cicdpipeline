INSERT INTO deployments (name, schedule_time, event_based, trigger,branch) 
VALUES ('Deployment 1', '2022-01-01 12:00:00', true, 'event','master'),
       ('Deployment 2', '2022-02-01 12:00:00', false, 'schedule','master'),
       ('Deployment 3', '2022-03-01 12:00:00', true, 'event','dev'),
       ('Deployment 4', '2022-04-01 12:00:00', false, 'schedule','master'),
       ('Deployment 5', '2022-05-01 12:00:00', true, 'manual','dev');

INSERT INTO tasks (deployment_id, name, task_order) 
VALUES (1, 'Task 1', 1),
       (1, 'Task 2', 2),
       (2, 'Task 3', 1),
       (2, 'Task 4', 2),
       (3, 'Task 5', 1);


INSERT INTO deployment_history (deployment_id, deployment_status, commit_id, branch)
VALUES (1, 'pass', 'abcd1234', 'master'),
       (2, 'fail', 'efgh5678', 'dev'),
       (3, 'pass', 'ijkl9101', 'feature/new_feature'),
       (4, 'fail', 'mnop1234', 'master'),
       (5, 'pass', 'qrst5678', 'dev');
