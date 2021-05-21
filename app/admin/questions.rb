ActiveAdmin.register Question do
  permit_params :genre, :title, :content, :answer
end
