package org.example.otel.example;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Slf4j
@RequestMapping
@RestController
public class ApplicationController {

    @RequestMapping(method = {GET, POST})
    private void logRoute() {
        log.info("This log should include traceId + spanId");
    }
}
