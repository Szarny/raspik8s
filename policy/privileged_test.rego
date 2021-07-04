package privileged

test_privileged_container_denied {
    results := deny with input as deployment(true)
    count(results) == 0
}

test_nonprivileged_container_allowed {
    results := deny with input as deployment(false)
    count(results) == 0
}

deployment(privileged) = d {
    d := {
        "kind": "Deployment",
        "metadata": {
            "name": "foobar"
        },
        "spec": {
            "template": {
                "spec": {
                    "containers": [{
                        "securityContext": {
                            "privileged": privileged
                        }
                    }]
                }
            }
        }
    }
}