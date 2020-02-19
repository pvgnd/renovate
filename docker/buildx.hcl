group "default" {
	targets = ["renovate-full", "renovate-slim"]
}

group "cache" {
	targets = ["renovate-full-cache", "renovate-slim-cache"]
}

target "slim" {
  dockerfile = "Dockerfile.slim"
}

target "full" {
  dockerfile = "Dockerfile"
}

target "settings" {
}

target "renovate-full-cache" {
  inherits = ["settings"]
  cache-to = ["type=local,dest=tmp/docker/full,mode=max"]
  target = "final-base"
}

target "renovate-slim-cache" {
  inherits = ["slim", "settings"]
  cache-to = ["type=local,dest=tmp/docker/slim,mode=max"]
  target = "final-base"
}

target "renovate-slim" {
  inherits = ["slim", "settings"]
  tags = ["renovate/renovate:slim"]
  cache-from = ["type=local,src=tmp/docker/slim"]
}

target "renovate-full" {
  inherits = ["full", "settings"]
  tags = ["renovate/renovate"]
  cache-from = ["type=local,src=tmp/docker/full"]
}
