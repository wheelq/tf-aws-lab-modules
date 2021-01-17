output "sns_topic_arn" {
  description = "SNS Topic ARN"
  value       = module.sns_create.sns_topic_arn
}

output "sns_topic_policy" {
  description = "SNS Topic policy - dump"
  value       = module.sns_policy_attachment.sns_topic_policy
}

