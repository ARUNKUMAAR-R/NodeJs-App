## Author : ARUNKUMAAR R
## Description : Creating ECS Cluster,ECS Task Definition and ECS Service
## Date : 17/05/24


resource "aws_ecs_cluster" "hello_world_cluster" {
  name = "hello-world-cluster"
}


resource "aws_ecs_task_definition" "hello_world" {
  family                   = "hello-world-family"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"
  memory                   = "2048"
  task_role_arn            = aws_iam_role.hello-ecs_task_role.arn
  execution_role_arn       = aws_iam_role.hello-ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "hello-world"
      image     = "111151604484.dkr.ecr.us-east-1.amazonaws.com/hello:latest"
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]


    }
  ])

}

resource "aws_ecs_service" "hello_world_service" {
  name            = "hello-world-service"
  cluster         = aws_ecs_cluster.hello_world_cluster.id
  task_definition = aws_ecs_task_definition.hello_world.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [aws_subnet.public_subnet1.id]
    security_groups = [aws_security_group.sg_nodejs.id]
    assign_public_ip = true
  }
}

