json.extract! subject, :id, :title, :description, :public_uid, :state, :ancestry, :created_at, :updated_at
json.url subject_url(subject, format: :json)
