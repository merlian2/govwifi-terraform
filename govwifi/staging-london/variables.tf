variable "Env-Name" {
  type    = string
  default = "staging"
}

variable "product-name" {
  type    = string
  default = "GovWifi"
}

variable "Env-Subdomain" {
  type        = string
  default     = "staging.wifi"
  description = "Environment-specific subdomain to use under the service domain."
}

variable "ssh-key-name" {
  type    = string
  default = "govwifi-staging-key-20180530"
}

# Entries below should probably stay as is for different environments
#####################################################################
variable "aws-region" {
  type    = string
  default = "eu-west-2"
}

variable "aws-region-name" {
  type    = string
  default = "London"
}

variable "backup-region-name" {
  type    = string
  default = "Dublin"
}

variable "zone-count" {
  type    = string
  default = "3"
}

# Zone names and subnets MUST be static, can not be constructed from vars.
variable "zone-names" {
  type = map(string)

  default = {
    zone0 = "eu-west-2a"
    zone1 = "eu-west-2b"
    zone2 = "eu-west-2c"
  }
}

variable "ami" {
  # eu-west-2, Amazon Linux AMI 2017.09.l x86_64 ECS HVM GP2
  default     = "ami-2218f945"
  description = "AMI id to launch, must be in the region specified by the region variable"
}

# Secrets

variable "auth-sentry-dsn" {
  type = string
}

variable "safe-restart-sentry-dsn" {
  type = string
}

variable "public-google-api-key" {
  type    = string
  default = "AIzaSyCz1cPYKamsA_ZJCygL9EY0Zq6stkazTco"
}

variable "otp-secret-encryption-key" {
  type        = string
  description = "Encryption key used to verify OTP authentication codes"
}

variable "user-signup-sentry-dsn" {
  type = string
}

variable "logging-sentry-dsn" {
  type = string
}

variable "admin-sentry-dsn" {
  type = string
}

variable "db-password" {
  type        = string
  description = "Database main password"
}

variable "db-user" {
  type        = string
  description = "Database username"
}

variable "user-db-password" {
  type        = string
  description = "User details database main password"
}

variable "user-db-username" {
  type        = string
  description = "Users database username"
}

variable "user-db-hostname" {
  type        = string
  description = "User details database hostname"
  default     = "users-db.london.staging.wifi.service.gov.uk"
}

variable "user-rr-hostname" {
  type        = string
  description = "User details read replica hostname"
  default     = "users-rr.london.staging.wifi.service.gov.uk"
}

variable "admin-db-username" {
  type        = string
  description = "Database main username for govwifi-admin"
}

variable "admin-db-password" {
  type        = string
  description = "Database main password for govwifi-admin"
}

variable "zendesk-api-user" {
  type        = string
  description = "Username for authenticating with Zendesk API"
}

variable "zendesk-api-token" {
  type        = string
  description = "Token for authenticating with Zendesk API"
}

variable "hc-key" {
  type        = string
  description = "Health check process shared secret"
}

variable "hc-ssid" {
  type        = string
  description = "Healt check simulated SSID"
}

variable "hc-identity" {
  type        = string
  description = "Healt check identity"
}

variable "hc-password" {
  type        = string
  description = "Health check password"
}

variable "shared-key" {
  type        = string
  description = "A random key to be shared between the frontend and backend to retrieve initial client setup."
}

variable "notify-api-key" {
  type        = string
  description = "API key used to authenticate with GOV.UK Notify"
}

variable "aws-account-id" {
  type        = string
  description = "The ID of the AWS tenancy."
}

variable "aws-secondary-account-id" {
  type        = string
  description = "The ID the Secondary Staging AWS Account."
}

variable "admin-secret-key-base" {
  type        = string
  description = "Rails secret key base for the Admin platform"
}

variable "docker-image-path" {
  type        = string
  description = "ARN used to identify the common path element used for the docker API image repositories."
}

variable "route53-zone-id" {
  type        = string
  description = "Zone ID used by the Route53 DNS service."
}

variable "performance-url" {
  type        = string
  description = "URL endpoint leading to Performance platform API, with a trailing slash at the end"
  default     = "unused-on-staging"
}

variable "performance-dataset" {
  type        = string
  description = "Dataset to which Performance statistics should be saved e.g `gov-wifi`"
  default     = "unused-on-staging"
}

variable "performance-bearer-volumetrics" {
  type        = string
  description = "Bearer token for `volumetrics` Performance platform statistics"
  default     = "unused-on-staging"
}

variable "performance-bearer-completion-rate" {
  type        = string
  description = "Bearer token for `completion-rate` Performance platform statistics"
  default     = "unused-on-staging"
}

variable "performance-bearer-active-users" {
  type        = string
  description = "Bearer token for `active-users` Performance platform statistics"
  default     = "unused-on-staging"
}

variable "performance-bearer-unique-users" {
  type        = string
  description = "Bearer token for `unique-users` Performance platform statistics"
  default     = "unused-on-staging"
}

variable "performance-bearer-roaming-users" {
  type        = string
  description = "Bearer token for `roaming-users` Performance platform statistics"
  default     = "unused-on-staging"
}

variable "london-radius-ip-addresses" {
  type        = list(string)
  description = "Frontend RADIUS server IP addresses - London"
}

variable "dublin-radius-ip-addresses" {
  type        = list(string)
  description = "Frontend RADIUS server IP addresses - Dublin"
}

variable "london-api-base-url" {
  type        = string
  description = "Base URL for authentication, user signup and logging APIs"
  default     = "https://api-elb.london.staging.wifi.service.gov.uk:8443"
}

variable "device-wifi-docker-image-path" {
  type        = string
  description = "ARN used to identify the common path element used for the docker image repositories."
}

variable "govnotify-bearer-token" {
  type = string
}

variable "notification-email" {
}

variable "prometheus-IP-london" {
}

variable "prometheus-IP-ireland" {
}

variable "grafana-IP" {
}

variable "grafana-admin" {
}

variable "google-client-secret" {
}

variable "google-client-id" {
}

variable "grafana-server-root-url" {
}

variable "allowed-sites-api-elb-ssl-cert-arn" {
  description = "Unused in this configuration"
}

variable "backend-subnet-IPs-list" {
  description = "Unused in this configuration"
}

variable "metrics-aws-secret-access-key" {
  description = "Unused in this configuration"
}

variable "administrator-IPs-list" {
  description = "Unused in this configuration"
}

variable "metrics-aws-access-key" {
  description = "Unused in this configuration"
}

variable "aws-parent-account-id" {
  description = "Unused in this configuration"
}

variable "volumetrics-elasticsearch-endpoint" {
  type        = string
  description = "URL for the ElasticSearch instance endpoint"
}

variable "use_env_prefix" {
  default     = true
  type        = bool
  description = "Conditional to indicate whether to retrieve a secret with a env prefix in its name."
}

variable "backup_mysql_rds" {
  description = "Conditional to indicate whether to make artifacts for and run RDS MySQL backups."
  default     = true
  type        = bool
}
