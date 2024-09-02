package com.sky.service.impl;

import com.sky.dto.SetmealDTO;
import com.sky.entity.Setmeal;
import com.sky.entity.SetmealDish;
import com.sky.mapper.SetmealDishMapper;
import com.sky.mapper.SetmealMapper;
import com.sky.service.SetmealService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 套餐业务实现
 */
@Service
@Slf4j
public class SetmealServiceImpl implements SetmealService {

    @Autowired
    private SetmealMapper setmealMapper;
    @Autowired
    private SetmealDishMapper setmealDishMapper;

    /**
     * 新增套餐,同时需要保存套餐和菜品的关联关系
     *
     * @param setmealDTO
     */
    @Transactional
    public void saveWithDish(SetmealDTO setmealDTO) {
        /*在setmeal表中插入数据*/
        Setmeal setmeal = new Setmeal();
        BeanUtils.copyProperties(setmealDTO, setmeal);
        setmealMapper.insert(setmeal);

        /*在setmeal_dish中插入数据*/
        //表格(setmeal_dish).setmealId == 表格(setmeal).id
        Long setmealId = setmeal.getId();

        //从setmealDTO中获取List<SetmealDish> setmealDishes 该数组中的元素已经包含了除id以外的所有菜品信息
        List<SetmealDish> setmealDishes = setmealDTO.getSetmealDishes();
        //遍历这个数组,每个元素都是套菜中的一道菜,然后在单个循环中给每道菜对象的id赋值
        for (SetmealDish setmealDish : setmealDishes) {
            setmealDish.setSetmealId(setmealId);
        }
        //将已经赋值id的包含所有菜品的数组setmealDishes批量插入到setmeal_dish中
        setmealDishMapper.insertBatch(setmealDishes);
    }
}
