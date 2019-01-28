# Create ECS Cluster

resource "aws_ecs_cluster" "frontend-cluster" {
  name = "${var.Env-Name}-frontend-cluster"
}

resource "aws_cloudwatch_log_group" "frontend-log-group" {
  name = "${var.Env-Name}-frontend-docker-log-group"

  retention_in_days = 90
}

resource "aws_ecr_repository" "govwifi-frontend-ecr" {
  count = "${var.create-ecr}"
  name  = "govwifi/frontend"
}

resource "aws_ecs_task_definition" "radius-task" {
  family = "radius-task-${var.Env-Name}"

  container_definitions = <<EOF
[
  {
    "volumesFrom": [],
    "memory": 1000,
    "extraHosts": null,
    "dnsServers": null,
    "disableNetworking": null,
    "dnsSearchDomains": null,
    "portMappings": [
      {
        "hostPort": 8080,
        "containerPort": 80,
        "protocol": "tcp"
      },
      {
        "hostPort": 3000,
        "containerPort": 3000,
        "protocol": "tcp"
      },
      {
        "hostPort": 1812,
        "containerPort": 1812,
        "protocol": "udp"
      },
      {
        "hostPort": 1813,
        "containerPort": 1813,
        "protocol": "udp"
      }
    ],
    "hostname": null,
    "essential": true,
    "entryPoint": null,
    "mountPoints": [],
    "name": "frontend-radius",
    "ulimits": null,
    "dockerSecurityOptions": null,
    "environment": [
      {
        "name": "AUTHORISATION_API_BASE_URL",
        "value": "${var.auth-api-base-url}"
      },{
        "name": "LOGGING_API_BASE_URL",
        "value": "${var.logging-api-base-url}"
      },{
        "name": "RADIUS_CONFIG_WHITELIST_URL",
        "value": "https://s3.eu-west-2.amazonaws.com/govwifi-${var.rack-env}-admin/clients.conf"
      },{
        "name": "BACKEND_API_KEY",
        "value": "${var.shared-key}"
      },{
        "name": "HEALTH_CHECK_RADIUS_KEY",
        "value": "${var.healthcheck-radius-key}"
      },{
        "name": "HEALTH_CHECK_SSID",
        "value": "${var.healthcheck-ssid}"
      },{
        "name": "HEALTH_CHECK_IDENTITY",
        "value": "${var.healthcheck-identity}"
      },{
        "name": "HEALTH_CHECK_PASSWORD",
        "value": "${var.healthcheck-password}"
      },{
        "name": "SERVICE_DOMAIN",
        "value": "${var.Env-Subdomain}"
      },{
        "name": "RADIUSD_PARAMS",
        "value": "${var.radiusd-params}"
      },{
        "name": "RACK_ENV",
        "value": "${var.rack-env}"
      },{
        "name": "CERT_STORE_URL",
        "value": "https://${aws_s3_bucket.frontend-cert-bucket.bucket_domain_name}"
      }
    ],
    "links": null,
    "workingDirectory": null,
    "readonlyRootFilesystem": null,
    "image": "${var.docker-image}",
    "command": null,
    "user": null,
    "dockerLabels": null,
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${aws_cloudwatch_log_group.frontend-log-group.name}",
        "awslogs-region": "${var.aws-region}",
        "awslogs-stream-prefix": "${var.Env-Name}-docker-logs"
      }
    },
    "cpu": 1000,
    "privileged": null,
    "expanded": true
  }
]
EOF
}

resource "aws_ecs_service" "frontend-service" {
  name            = "frontend-service-${var.Env-Name}"
  cluster         = "${aws_ecs_cluster.frontend-cluster.id}"
  task_definition = "${aws_ecs_task_definition.radius-task.arn}"
  desired_count   = "${var.radius-instance-count}"

  ordered_placement_strategy {
    type  = "spread"
    field = "instanceId"
  }
}
