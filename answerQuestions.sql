Question 1.)List all the tasks of specific deployment id in the order they need to be executed:

SELECT name, "task_order" FROM tasks WHERE deployment_id = [deployment_id] ORDER BY "task_order";

Question 2.)Get all the deployments which are event-based:

SELECT * FROM deployments WHERE event_based = true;

Question 3.)List all deployments which are scheduled the day after tomorrow:

SELECT * FROM deployments WHERE schedule_time BETWEEN NOW() + INTERVAL '2 days' AND NOW() + INTERVAL '3 days';

Question 4.)Display the history of a given deployment with the timestamp, deployment_status (fail or pass) and commit id and branch:

SELECT timestamp, deployment_status, commit_id, branch FROM deployment_history WHERE deployment_id = [deployment_id];

Question 5.)Get json of all deployments details for given branch:

SELECT row_to_json(t) FROM (SELECT * FROM deployments WHERE branch = '[branch]') t;

Question 6.)Stat of CI and CD in date range

a.)Number of test execution and average success rates

b.)Number of deployments 

c.)Number of deployments grouped by triggers

WITH status AS (
  SELECT date_trunc('day', timestamp) AS day,
    deployment_status,
    COUNT(*)
  FROM deployment_history
  WHERE timestamp BETWEEN '2023-01-20' AND '2023-01-23'
  GROUP BY day, deployment_status
)
SELECT day,
  SUM(CASE WHEN deployment_status = 'pass' THEN count END) as pass_count,
  SUM(CASE WHEN deployment_status = 'fail' THEN count END) as fail_count
FROM status
GROUP BY day
ORDER BY day;

Question 7.)Assuming all 3 actions are running, get estimated completion time for a given queued action. Queue might have a number of  actions already queued in front.




