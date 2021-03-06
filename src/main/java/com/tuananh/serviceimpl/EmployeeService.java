package com.tuananh.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import com.tuananh.controller.admin.api.UploadFileController;
import com.tuananh.dao.IDepartmentDAO;
import com.tuananh.dao.IEmployeeDAO;
import com.tuananh.model.DepartmentModel;
import com.tuananh.model.EmployeeModel;
import com.tuananh.paging.Pageble;
import com.tuananh.service.IEmployeeService;

public class EmployeeService implements IEmployeeService {
	@Inject
	private IEmployeeDAO employeeDAO;

	@Inject
	private IDepartmentDAO departmentDAO;

	@Override
	public List<EmployeeModel> findByDepartmentId(Long departmentId) {
		// TODO Auto-generated method stub
		return employeeDAO.findByDepartmentId(departmentId);
	}

	@Override
	public EmployeeModel save(EmployeeModel employeeModel) {
		
		List<Long> list = employeeModel.getDepartmentIdMapping(); // danh sách department mà client gửi lên (theo id)
		Long employeeId = employeeDAO.save(employeeModel);
		UploadFileController upload = new UploadFileController(); 
		String imageName = upload.getExtendedFileName(employeeId);
		 
		for (Long o : list) {
			departmentDAO.saveDepartmentAndEmployee( employeeId, o);
		}
		employeeDAO.saveImageName(imageName, employeeId);
		
		
		
		return employeeDAO.findOne(employeeId);
	}

	@Override
	public EmployeeModel update(EmployeeModel updateEmployee) {
		List<Long> list = updateEmployee.getDepartmentIdMapping(); // danh sách department mà client gửi lên (theo id)
		List<DepartmentModel> departmentExisted = departmentDAO.findByEmployeeId(updateEmployee.getId()); // danh sách
																											// department
																											// (theo id)
		if (!departmentExisted.isEmpty()) {
			departmentDAO.deleteByEmployeeId(updateEmployee.getId());
		}

		for (Long o : list) {
			departmentDAO.saveDepartmentAndEmployee( updateEmployee.getId(), o);
		}

		employeeDAO.update(updateEmployee);
		return employeeDAO.findOne(updateEmployee.getId());
	}

	@Override
	public void delete(long[] ids) {
		for (long id : ids) {
			employeeDAO.delete(id);
			departmentDAO.deleteByEmployeeId(id);
		}
	}

	@Override
	public List<EmployeeModel> findAll(Pageble pageble) {
		return employeeDAO.findAll(pageble);
	}

	@Override
	public int getTotalItem() {
		// TODO Auto-generated method stub
		return employeeDAO.getTotalItem();
	}

	@Override
	public EmployeeModel findOne(long id) {
		EmployeeModel employeeModel = employeeDAO.findOne(id);
		List<DepartmentModel> departmentModels = departmentDAO.findByEmployeeId(id);
		if (!departmentModels.isEmpty()) {
			employeeModel.setDepartmentIds(departmentModels);
		}

		return employeeModel;
	}

	@Override
	public List<EmployeeModel> searchByName(Pageble pageble, String employeeName) {
		// TODO Auto-generated method stub
		return employeeDAO.searchByName(pageble, employeeName);
	}

	@Override
	public List<EmployeeModel> findTop7(Pageble pageble) {
		// TODO Auto-generated method stub
		return employeeDAO.findTop7(pageble);
	}

	@Override
	public List<EmployeeModel> getNext3(Pageble pageble, int offset) {
		// TODO Auto-generated method stub
		return employeeDAO.getNext3(pageble, offset);
	}

}
