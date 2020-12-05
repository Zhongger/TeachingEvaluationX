import request from '@/utils/request'
import { praseStrEmpty } from "@/utils/ruoyi";

//查询学生信息
export function listStudent(query) {
  return request({
    url: '/student/list',
    method: 'get',
    params: query
  })
}

// 新增选课
export function addSelectCourse(data) {
  return request({
    url: '/student/addSelectCourse',
    method: 'post',
    data: data
  })
}

export function deleteSelectCourse(data) {
  return request({
    url: '/student/deleteSelectCourse',
    method: 'post',
    data: data
  })
}
