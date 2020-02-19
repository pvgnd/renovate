group "default" {
	targets = ["renovate", "renovate-slim"]
}

target "base" {
  dockerfile = "Dockerfile.slim",
  cache-to = ["type=local,dest=tmp/docker"]
  target = "base"
}

target "cache" {
}

target "renovate-slim" {
	inherits = ["cache"],
  dockerfile = "Dockerfile.slim",
  tags = ["renovate/renovate:slim"]
}

target "renovate" {
	inherits = ["cache"],
  tags = ["renovate/renovate"]
}
