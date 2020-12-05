package com.zhongger.web.controller.teacher;

import com.zhongger.common.core.controller.BaseController;
import com.zhongger.common.core.domain.entity.SysUser;
import com.zhongger.common.core.page.TableDataInfo;
import com.zhongger.common.teacher.domain.TeacherVO;
import com.zhongger.common.teacher.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by Zhong Mingyi on 2020/12/4.
 */
@RestController
@RequestMapping("/teacher")
public class TeacherController extends BaseController {

    @Autowired
    private TeacherService teacherService;

    @GetMapping("/list")
    public TableDataInfo list(SysUser user){
        startPage();
        List<TeacherVO> list = teacherService.selectTeacherList(user.getUserName(),"teacher");
        return getDataTable(list);
    }

}