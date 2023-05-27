package com.shivangam.URLShortener.controller;

import com.shivangam.URLShortener.service.URLShortenerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class URLShortenerController {
    @Autowired
    private URLShortenerService urlService;

    @GetMapping("/shorten")
    public String shortenURL(@RequestBody String originalURL) {
        return urlService.shortenURL(originalURL);
    }

    @GetMapping("/expand")
    public String expandURL(@RequestBody String shortURL) {
        return urlService.expandURL(shortURL);
    }
}
