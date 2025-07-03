resource "aws_db_instance" "wordpress_db" {
  identifier         = "${var.project}-db"
  instance_class     = var.db_instance_class
  engine             = "mysql"
  username           = var.db_user
  password           = var.db_password
  db_name            = var.db_name
  allocated_storage      = var.allocated_storage
  vpc_security_group_ids = [var.security_group]
  db_subnet_group_name   = aws_db_subnet_group.this.name
  skip_final_snapshot    = true
  multi_az               = false
}
resource "aws_db_subnet_group" "this" {
  name       = "${var.project}-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project}-subnet-group"
  }
}
