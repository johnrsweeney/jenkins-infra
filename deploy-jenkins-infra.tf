resource "aws_instance" "jenkins_server" {
  ami             = "ami-08095fbc7037048f3"
  instance_type   = "t2.medium"
  key_name        = "sweeney_london"
  security_groups = ["CentOS 8 -x86_64- - with Updates HVM-2004_01-AutogenByAWSMP-"]
  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = 10
    tags        = {function = "jenkins_master_db"}
  }
}
