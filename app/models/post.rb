class Post < ApplicationRecord
	validates :title, exclusion:{in:[nil, ""]}
	validates :body, exclusion:{in:[nil, ""]}
end
