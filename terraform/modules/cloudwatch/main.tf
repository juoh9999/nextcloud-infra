# ✅ modules/cloudwatch/main.tf
resource "aws_cloudwatch_metric_alarm" "ec2_cpu" {
  count               = length(var.ec2_instance_ids)
  alarm_name          = "HighCPU-${count.index}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This metric monitors high CPU usage on EC2"
  dimensions = {
    InstanceId = var.ec2_instance_ids[count.index]
  }
  actions_enabled = false
}

resource "aws_cloudwatch_metric_alarm" "rds_cpu" {
  alarm_name          = "High-RDS-CPU"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This metric monitors high CPU usage on RDS"
  dimensions = {
    DBInstanceIdentifier = var.rds_instance_id
  }
  actions_enabled = false
}

resource "aws_cloudwatch_metric_alarm" "s3_latency" {
  alarm_name          = "High-S3-Latency"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "FirstByteLatency"
  namespace           = "AWS/S3"
  period              = 60
  statistic           = "Average"
  threshold           = 2000
  alarm_description   = "High latency detected in S3 bucket"
  dimensions = {
    BucketName = var.s3_bucket_name
    StorageType = "AllStorageTypes"
  }
  actions_enabled = false
}
