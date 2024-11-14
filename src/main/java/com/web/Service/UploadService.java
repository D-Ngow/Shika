package com.web.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import jakarta.servlet.ServletContext;
import java.io.File;


@Service
public class UploadService {

    @Autowired
    private ServletContext app;

    public File save(MultipartFile file, String folder) {
        File dir = new File(app.getRealPath(folder));
        if (!dir.exists()) {
            dir.mkdirs();
        }
        try {
            File saveFile = new File(dir, file.getOriginalFilename());
            file.transferTo(saveFile);
            return saveFile;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
}

