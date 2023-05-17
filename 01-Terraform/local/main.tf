provider "local" {
}

# Infra resource
resource "local_file" "foo" {
  # path.module - String inter pdation terraform Variable
  # ${path.module} : string interpolation Grammar
  # path of directory for the file, main.tf
  filename = "${path.module}/foo.txt"
  content  = "Hello world!"
}
