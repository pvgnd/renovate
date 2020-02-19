group "default" {
	targets = ["renovate-full", "renovate-slim"]
}

group "cache" {
	targets = ["renovate-full-cache", "renovate-slim-cache"]
}


target "renovate-full-cache" {
  inherits = ["settings"]
  cache-to = "type=local,dest=tmp/docker/full,mode=max"
  target = "final-base"
}

target "renovate-slim-cache" {
  inherits = ["settings"]
  cache-to = "type=local,dest=tmp/docker/slim,mode=max"
  dockerfile = "Dockerfile.slim",
  target = "final-base"
}

target "settings" {
}

target "renovate-slim" {
  inherits = ["settings"]
  dockerfile = "Dockerfile.slim",
  tags = ["renovate/renovate:slim"]
}

target "renovate-full" {
  inherits = ["settings"]
  tags = ["renovate/renovate"]
}
