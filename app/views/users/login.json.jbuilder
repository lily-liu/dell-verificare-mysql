json.status "success"
json.message "user"
json.data do
  json.Username @data[:Username]
  json.Level @data[:Level]
  json.Name @data[:Name]
  json.Token @data[:Token]
end
