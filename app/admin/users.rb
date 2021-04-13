ActiveAdmin.register User do
  permit_params :email, :encrypted_password
end
