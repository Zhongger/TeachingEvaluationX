import request from '@/utils/request'
import { praseStrEmpty } from "@/utils/ruoyi";

//查询学生信息
export function listTeacher(query) {
  return request({
    url: '/teacher/list',
    method: 'get',
    params: query
  })
}
