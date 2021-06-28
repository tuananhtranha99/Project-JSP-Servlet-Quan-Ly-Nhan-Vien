package com.tuananh.controller.admin;

import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tuananh.constant.SystemConstant;
import com.tuananh.model.DepartmentModel;
import com.tuananh.model.EmployeeModel;
import com.tuananh.paging.PageRequest;
import com.tuananh.paging.Pageble;
import com.tuananh.service.IDepartmentService;
import com.tuananh.service.IEmployeeService;
import com.tuananh.sort.Sorter;
import com.tuananh.utils.FormUtil;
import com.tuananh.utils.MessageUtil;

@WebServlet(urlPatterns = { "/admin-employee-edit" })
public class EmployeeEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private IEmployeeService employeeService;

	@Inject
	private IDepartmentService departmentService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmployeeModel model = FormUtil.toModel(EmployeeModel.class, req);
		String view = "/views/admin/employee/edit.jsp";
		List<DepartmentModel> departments = departmentService.findAll();
		if (model.getId() != null) {
			model = employeeService.findOne(model.getId());
			List<DepartmentModel> departmentChecked = departmentService.findByEmployeeId(model.getId());
			if (departmentChecked != null) {
				if (departments.size() == departmentChecked.size()) {
					for (DepartmentModel dep : departments) {
						dep.setCheck("checked");
					}
				} else {
					departments.removeAll(departmentChecked);
					for (DepartmentModel dep : departmentChecked) {
						dep.setCheck("checked");

					}
					departments.addAll(departmentChecked);
					Collections.sort(departments);
				}
			}
		}
		req.setAttribute("departments", departments);
		MessageUtil.showMessage(req);
		req.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}