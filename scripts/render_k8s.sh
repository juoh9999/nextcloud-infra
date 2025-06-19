#!/bin/bash
set -e

echo "[+] Rendering Kubernetes manifests from Terraform outputs..."

ECR_URL=$(terraform output -raw ecr_url)
RDS_ENDPOINT=$(terraform output -raw rds_endpoint)
S3_BUCKET_NAME=$(terraform output -raw s3_bucket_name 2>/dev/null || echo "nextcloud9999") # fallback
ALB_SG_ID=$(terraform output -raw alb_sg_id)
DOMAIN="pomeranian99.click"
ALB_SUBNETS=$(terraform output -json public_subnets | jq -r 'join(",")')

CERT_ARN=$(terraform output -raw cert_arn)
export CERT_ARN
envsubst < k8s/ingress.tpl.yml > k8s/ingress.yml


export ECR_URL RDS_ENDPOINT S3_BUCKET_NAME ALB_SG_ID DOMAIN ALB_SUBNETS

envsubst < k8s/deployment.tpl.yml > k8s/deployment.yml
envsubst < k8s/ingress.tpl.yml > k8s/ingress.yml

echo "[✓] Kubernetes manifests rendered successfully."

