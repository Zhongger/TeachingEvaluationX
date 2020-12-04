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
