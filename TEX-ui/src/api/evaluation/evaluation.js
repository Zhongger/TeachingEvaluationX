import request from '@/utils/request'
import { praseStrEmpty } from "@/utils/ruoyi";

export function listEvaluation(data){
  return request({
    url: '/evaluation/list',
    method: 'post',
    params: data
  })
}

export function addEvaluation(data) {
  return request({
    data: data,
    url: '/evaluation/addEvaluation',
    method: 'post'
  })
}

export function updateEvaluation(data) {
  return request({
    data: data,
    url: '/evaluation/updateEvaluation',
    method: 'post'
  })
}
