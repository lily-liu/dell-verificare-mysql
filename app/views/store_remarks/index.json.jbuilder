json.status "success"
json.message "remarks"
json.data do
  json.array! @store_remarks, partial: 'store_remarks/store_remark', as: :store_remark
end