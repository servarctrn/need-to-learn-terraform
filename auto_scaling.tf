/*resource "aws_launch_template" "DennisLT1" {
  name_prefix            = "Test"
  image_id               = var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
  key_name               = ""
}

resource "aws_autoscaling_group" "rcode_deployment_test" {
  name                      = "servarc-dev-rcode-sg"
  desired_capacity          = 2
  max_size                  = 4
  min_size                  = 2
  health_check_grace_period = 300
  load_balancers = "servarc-test-alb"
  vpc_zone_identifier = ["${aws_subnet.public-subnet1.id}", "${aws_subnet.public-subnet2.id}" ]


  launch_template {
    id      = aws_launch_template.DennisLT1.id
    version = "$Latest"
  }
}


/*
resource "aws_autoscaling_policy" "rcode_deployment_test_policy" {
  autoscaling_group_name = "servarc-dev-rcode-sg"
  name                   = "rcode_test_policy"
  adjustment_type        = "ChangeInCapacity"
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    customized_metric_specification {
      metric_name = "AppromixateNumberOfMessage"
      namespace   = "rcodesqsmessage"
      statistic   = "Average"
      metric_dimension {
        name  = "AutoScalingGroupName"
        value = "servarc-dev-rcode-sg"
      }
    }
    target_value = 2.0
  }
}
*/
