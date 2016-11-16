json.status "success"
json.message "remarks"
json.data do
  json.partial! "store_remarks/store_remark", store_remark: @store_remark
end