import request from '@/utils/request'
import { praseStrEmpty } from "@/utils/ruoyi";

//查询教师信息
export function listTeacher(query) {
  return request({
    url: '/teacher/list',
    method: 'get',
    params: query
  })
}

//查询教师所任课程
export function listTeacherCourse(query) {
  return request({
    url: '/teacher/listTeacherCourse',
    method: 'get',
    params: query
  })
}
