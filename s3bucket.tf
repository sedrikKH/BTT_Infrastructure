# Сообщаем самому Terraform, где хранится удаленный бэкенд
terraform {
  backend "s3" {
    # Имя корзины, которое определили в самом начале
    bucket = "btt-state-bucket"
    # Путь к файлу состояния Terraform
    key    = "btt-infrastruvture-state/terraform.tfstate"
    region = "eu-central-1"

  }
}
