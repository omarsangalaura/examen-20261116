output "ip_public_app_main_py" {
    value = aws_instance.api_main_py.public_ip
}