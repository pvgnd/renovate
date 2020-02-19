group "default" {
	targets = ["renovate", "renovate-slim"]
}

target "base" {
  dockerfile = "Dockerfile.slim",
  cache-to = ["type=local,dest=tmp/docker,mode=max"]
  target = "base"
}

target "cache" {
  cache-from = ["type=local,src=tmp/docker"]
  cache-to = ["type=local,dest=tmp/docker,mode=max"]
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
