output "target_group_arn" {
  value       = "${aws_lb_target_group.group.arn}"
  description = "The ARN of the Target Group"
}

output "listener_id" {
  value       = "${aws_lb_listener.listener.id}"
  description = "The ARN of the listener."
}

output "terraform" {
  value       = "${aws_lb.nlb-loadbalancer.arn}"
  description = "The ARN of the LoadBalancer"
}
