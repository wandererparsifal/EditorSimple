package com.simple;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Global {

    public static String UPLOAD_PATH;

    public static String HTML_PATH;

    public static String IMAGE_DIR;

    @Value("#{configProperties['upload.path']}")
    public void setUploadPath(String path) {
        Global.UPLOAD_PATH = path;
    }

    @Value("#{configProperties['html.path']}")
    public void setHtmlPath(String path) {
        Global.HTML_PATH = path;
    }

    @Value("#{configProperties['image.directory']}")
    public void setImageDir(String dir) {
        Global.IMAGE_DIR = dir;
    }
}
