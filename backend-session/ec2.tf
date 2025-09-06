
resource "aws_instance" "mySampleInstance"{
    ami = "ami-0360c520857e3138f"
    instance_type = var.aws_instance_type
    count = 5

    tags={
        Name="MySampleInstance ${count.index}"
    }
}

resource "aws_s3_bucket" "sampleBucketName" {
    bucket = "myuniquebucketname20240906"
}


data "aws_ami" "myami" {
  most_recent = true
}

