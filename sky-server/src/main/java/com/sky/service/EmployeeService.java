package com.sky.service;

import com.sky.dto.EmployeeDTO;
import com.sky.dto.EmployeeLoginDTO;
import com.sky.dto.EmployeePageQueryDTO;
import com.sky.entity.Employee;
import com.sky.result.PageResult;

public interface EmployeeService {

    /**
     * 员工登录
     * @param employeeLoginDTO employeeLoginDTO
     * @return Employee
     */
    Employee login(EmployeeLoginDTO employeeLoginDTO);

    /**
     * 新增员工
     * @param employeeDTO employeeDTO
     */
    void save(EmployeeDTO employeeDTO);

    /**
     * 员工分页查询
     * @param employeePageQueryDTO name,page,pageSize
     * @return PageResult
     */
    PageResult pageQuery(EmployeePageQueryDTO employeePageQueryDTO);

    /**
     * ToggleStatus
     * 启动禁用员工账号
     * @param status 1:Enable 2:Disable
     * @param id     id
     */
    void toggleStatus(Integer status, Long id);

    /**
     * Get Emp by id
     * 根据员工id查询
     * @param id id
     * @return Employee
     */
    Employee getById(Long id);

    /**
     * 编辑员工信息
     * UPDATE EMP
     * @param employeeDTO employeeDTO
     */
    void update(EmployeeDTO employeeDTO);
}
