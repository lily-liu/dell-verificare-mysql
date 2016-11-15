json.status = 'success'
json.message = 'user'
json.data do
  json.extract! @user, :Username, :Level, :Name, :Password
end