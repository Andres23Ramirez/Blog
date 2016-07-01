class Comment < ActiveRecord::Base
  belongs_to :usuer
  belongs_to :article
end
