output "topic_arn" {
  description = "Topic ARN"
  value       = aws_sns_topic.user_updates.arn
}