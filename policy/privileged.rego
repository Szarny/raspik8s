package main

deny[{"msg": msg}] {
    input.kind == "Deployment"
    input.spec.template.spec.containers[_].securityContext.privileged
    msg := sprintf("Privileged container is not allowed: %v", [input.metadata.name])
}