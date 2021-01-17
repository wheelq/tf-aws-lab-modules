resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = var.sns_topic_arn
  protocol  = var.protocol
  endpoint  = var.endpoint
}