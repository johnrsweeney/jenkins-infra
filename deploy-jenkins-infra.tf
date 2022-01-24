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

resource "aws_instance" "jenkins_agent" {
  ami             = "ami-08095fbc7037048f3"
  instance_type   = "t2.medium"
  key_name        = "sweeney_london"
  security_groups = ["CentOS 8 -x86_64- - with Updates HVM-2004_01-AutogenByAWSMP-"]
}

resource "local_file" "jenkins_inventory" {
  filename        = "${path.module}/jenkins_inventory"
  file_permission = "0644"
  content         = templatefile("${path.module}/jenkins_inventory.tftpl",
                          {
                            jenkins_server_ip = "${aws_instance.jenkins_server.public_ip}",
                            jenkins_agent_ip  = "${aws_instance.jenkins_agent.public_ip}"
                          })
}
