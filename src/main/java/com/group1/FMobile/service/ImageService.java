package com.group1.fmobile.service;

import com.group1.fmobile.domain.dto.Brand;
import com.group1.fmobile.domain.dto.Image;

import java.util.List;

public interface ImageService {
    List<Image> getAll();
    Image getById(long Id);
    void saveOrUpdate(Image image);
    void delete(long Id);
}
