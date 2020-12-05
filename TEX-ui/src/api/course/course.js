import request from '@/utils/request'
import { praseStrEmpty } from "@/utils/ruoyi";

// 新增课程
export function addCourse(data) {
  return request({
    url: '/course/add',
    method: 'post',
    data: data
  })
}

export function listCourse(query) {
  return request({
    url: '/course/list',
    method: 'get',
    params: query
  })
}
