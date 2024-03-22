json.extract! user, :id, :name, :linkedin, :instagram, :email, :program_name, :department, :interest, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
