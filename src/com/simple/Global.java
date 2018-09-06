package com.simple;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Global {

    public static String UPLOAD_PATH;

    @Value("#{configProperties['upload.path']}")
    public void setUploadPath(String path) {
        Global.UPLOAD_PATH = path;
    }
}
