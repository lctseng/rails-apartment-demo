Apartment.configure do |config|
  # 因為 Devise 登入只能放在同一個 schema，因此將之從 apartment 排除
  config.excluded_models = ["User"]
  # 告知 apartment 如何找出所有的 tenant_name 供 migration 使用，這裡我們使用 User model 同名的欄位 tenant_name
  config.tenant_names = lambda{ User.pluck(:tenant_name) }
end