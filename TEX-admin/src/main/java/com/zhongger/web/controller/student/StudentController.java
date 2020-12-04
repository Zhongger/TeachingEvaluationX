package com.zhongger.web.controller.student;

import com.zhongger.common.core.controller.BaseController;
import com.zhongger.common.core.domain.entity.SysUser;
import com.zhongger.common.core.page.TableDataInfo;
import com.zhongger.common.student.domain.StudentVO;
import com.zhongger.common.student.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/4.
 */
@RestController
@RequestMapping("/student")
public class StudentController extends BaseController {

    @Autowired
    private StudentService studentService;

    @GetMapping("/list")
    public TableDataInfo list(SysUser user){
        startPage();
        List<StudentVO> list = studentService.selectStudentList(user.getUserName(),"student");
        return getDataTable(list);
    }

}
