json.extract! @comment, :id, :usuer_id, :article_id, :body, :created_at, :updated_at

json.usuer do
	json.email @comment.usuer.email
end