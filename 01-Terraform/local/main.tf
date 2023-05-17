provider "local" {
}

# Infra resource
resource "local_file" "foo" {
  # path.module - String inter pdation terraform Variable
  # ${path.module} : string interpolation Grammar
  # path of directory for the file, main.tf
  filename = "${path.module}/foo.txt"
  content  = data.local_file.bar.content
}

data "local_file" "bar" {
  filename = "${path.module}/bar.txt"
}

output "file_bar" {
  value = data.local_file.bar
}
