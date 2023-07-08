# Create ALB
resource "aws_lb" "servarc-test-alb" {
  name               = "servarc-test-alb"
  internal           = false
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  security_groups    = [aws_security_group.sgweb.id]
  subnets            = ["${aws_subnet.public-subnet1.id}", "${aws_subnet.public-subnet2.id}"]

  enable_deletion_protection = true
}

/*  access_logs {
    bucket  = aws_s3_bucket.lb_logs.bucket
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "Servarc-Test"
  }
}
*/
# Create ALB target group that forwards traffic to alb
resource "aws_lb_target_group" "servarc-test-tg" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.default.id
}


# Create target group attachment
# More details: https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_TargetDescription.html
# https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_RegisterTargets.html
resource "aws_lb_target_group_attachment" "tg_attachment" {
  target_group_arn = aws_lb_target_group.servarc-test-tg.arn
  # attach the ALB to this target group
  target_id = aws_lb.servarc-test-alb.arn
  #  If the target type is alb, the targeted Application Load Balancer must have at least one listener whose port matches the target group port.
  port = 80
} 