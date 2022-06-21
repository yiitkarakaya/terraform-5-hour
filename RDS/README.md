# Instructions on how how to create RDS instance 
### Please copy paste below code 
```
module rds {
    source = "yiitkarakaya/vpc-5/aws"
    region               = "us-east-1"
    allocated_storage    = 20
    engine               = "mysql"
    engine_version       = "5.7"
    instance_class       = "db.t3.micro"
    db_name              = "mydb"
    username             = "foo"
    publicly_accessible  = true
    tags = {
        Name = "main"
    }
}
```
### If you want the output 
```

output endpoint {
    value = module.rds.endpoint
}
```