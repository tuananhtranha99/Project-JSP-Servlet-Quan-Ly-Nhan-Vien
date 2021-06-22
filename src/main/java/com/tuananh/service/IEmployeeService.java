package com.tuananh.service;

import java.util.List;

import com.tuananh.model.EmployeeModel;

public interface IEmployeeService {
	List<EmployeeModel> findByDepartmentId(Long departmentId);
	EmployeeModel save(EmployeeModel employeeModel);
	EmployeeModel update(EmployeeModel updateEmployee);
	void delete(long[] ids);
}