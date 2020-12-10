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

export function listEvaluationStudent(data) {
  return request({
    url: '/teacher/listEvaluationStudent',
    method: 'post',
    params: data
  })
}

export function listEvaluationDetail(data) {
  return request({
    url: '/teacher/listEvaluationDetail',
    method: 'post',
    params: data
  })
}

export function getEvaluationContentResultAnalysis(data) {
  return request({
    url: '/teacher/getEvaluationContentResultAnalysis',
    method: 'get',
    params: data
  })
}

export function getEvaluationSummary(data) {
  return request({
    url: '/teacher/getEvaluationSummary',
    method: 'get',
    params: data
  })
}

export function getEvaluationSumList(data) {
  return request({
    url: '/teacher/getEvaluationSumList',
    method: 'get',
    params: data
  })
}
