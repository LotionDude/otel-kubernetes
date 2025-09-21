# Introduction

This project was created to show a discrepancy with tracing logic between a local environment and a kubernetes
environment when specifically using the following dependencies with specific configuration:

- `spring-cloud-starter-bootstrap`
- `spring-cloud-starter-kubernetes-client-config`
- `opentelemetry-spring-boot-starter`
- `micrometer-tracing`

When ran locally, logs will print the traceId and spanId as such:

```text
2025-09-21T23:22:56.168+03:00  INFO 7500 --- [simple-project] [nio-8081-exec-2] [7b714e143be3b3ea018dd92e27c31e03-1f54a24af69f2707] o.e.otel.example.ApplicationController   : This log should include traceId + spanId
```

the value `7b714e143be3b3ea018dd92e27c31e03-1f54a24af69f2707` is the traceId and spanId delimited with a `-` symbol.

When running the same application, and same configuration, in a kubernetes environment, the log will look like this, the
same format just without the trace and span:

```text
2025-09-21T20:21:49.724Z  INFO 7 --- [simple-project] [nio-8080-exec-3] [                                                 ] o.e.otel.example.ApplicationController   : This log should include traceId + spanId
```

# Project setup

This project is using `spring-cloud-starter-kubernetes-client-config` to load configMaps with the name
`simple-project-configmap` using the `spring-cloud-starter-bootstrap` dependency. It does this as configured in
the [bootstrap.yml](./src/main/resources/bootstrap.yml) file.

For our tracing solution, we're using `micrometer-tracing` for tracing and
`opentelemetry-spring-boot-starter` with the micrometer instrumentation.

For running this project in a kubernetes cluster, there's a `build-image.bat` script file which creates a docker
image, and a `Tiltfile` which can be run with `tilt up` which creates the deployment on the cluster.

You can make `GET/POST` requests to `localhost:8080` and view the logs in the tilt/local console.


