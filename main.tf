resource "aws_lb_target_group" "group" {
  name_prefix = "nlb-"
  port        = "${var.port}"
  protocol    = "${var.protocol}"
  vpc_id      = "${var.vpc_id}"

  health_check {
    protocol            = "${var.health_check_protocol}"
    port                = "${var.port}"
    healthy_threshold   = "${var.health_check_healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    interval            = "${var.health_check_interval}"

    #timeout             = "${var.health_check_timeout}"
  }

  tags {
    Name        = "${var.name}"
    Project     = "${var.project}"
    Purpose     = "${var.purpose}"
    Creator     = "${var.creator}"
    Environment = "${var.environment}"
    Freetext    = "${var.freetext}"
  }
}

resource "aws_lb" "nlb-loadbalancer" {
  name               = "${var.lbname}"
  internal           = true
  load_balancer_type = "${var.load_balancer_type}"
  subnets            = "${var.subnets}"

  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = true

  tags {
    Name        = "${var.name}"
    Project     = "${var.project}"
    Purpose     = "${var.purpose}"
    Creator     = "${var.creator}"
    Environment = "${var.environment}"
    Freetext    = "${var.freetext}"
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = "${aws_lb.nlb-loadbalancer.arn}"
  port              = "${var.port}"
  protocol          = "${var.protocol}"

  default_action {
    target_group_arn = "${aws_lb_target_group.group.arn}"
    type             = "forward"
  }
}
