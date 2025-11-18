output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_rt_id" {
  value = aws_route_table.public.id
}
