provider "local" {
}

variable "names" {
	description = "a List of names"
	type				= list(string)
	default			= ["neo", "trinity", "morpheous"]
}

variable "hero_thousand_faces" {
	description = "map"
	type				= map(string)
	default			= {
		neo				= "hero"
		trinity		= "love interest"
		morpheous = "mentor"
	}
}

output "upper_roles" {
	value = {for name, role in var.hero_thousand_faces : upper(name) => upper(role)}
}

output "upper_names" {
	value = [for name in var.names : upper(name)]
}
