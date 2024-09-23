package com.group1.fmobile.service;

import com.group1.fmobile.domain.dto.Image;
import com.group1.fmobile.repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageServiceImp implements ImageService{
    @Autowired
    private ImageRepository imageRepository;

    @Override
    public List<Image> getAll() {
        return this.imageRepository.findAll();
    }

    @Override
    public Image getById(long Id) {
        return this.imageRepository.findById(Id).get();
    }

    @Override
    public void saveOrUpdate(Image image) {
        imageRepository.save(image);

    }

    @Override
    public void delete(long Id) {
        imageRepository.deleteById(Id);
    }
}
