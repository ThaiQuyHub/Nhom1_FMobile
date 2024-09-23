package com.group1.fmobile.service;

import com.group1.fmobile.domain.Brand;
import com.group1.fmobile.repository.BrandRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BrandServiceImp implements BrandService{

    @Autowired
    private BrandRepository brandRepository;

    @Override
    public List<Brand> getAll() {
        return this.brandRepository.findAll();
    }

    @Override
    public Brand getById(long Id) {
        return this.brandRepository.findById(Id).get();
    }

    @Override
    public void saveOrUpdate(Brand brand) {
        brandRepository.save(brand);
    }

    @Override
    public void delete(long Id) {
        brandRepository.deleteById(Id);
    }
}
